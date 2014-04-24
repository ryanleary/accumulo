/*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.apache.accumulo.master.replication;

import org.apache.accumulo.core.client.AccumuloException;
import org.apache.accumulo.core.client.AccumuloSecurityException;
import org.apache.accumulo.core.client.Connector;
import org.apache.accumulo.core.conf.AccumuloConfiguration;
import org.apache.accumulo.core.conf.Property;
import org.apache.accumulo.core.util.Daemon;
import org.apache.accumulo.fate.util.UtilWaitThread;
import org.apache.accumulo.master.Master;
import org.apache.log4j.Logger;

/**
 * Daemon wrapper around the {@link WorkMaker}
 */
public class WorkDriver extends Daemon {
  private static final Logger log = Logger.getLogger(WorkDriver.class);
  
  private final Master master;
  private final AccumuloConfiguration conf;

  private WorkMaker workMaker;

  public WorkDriver(Master master) {
    super("Replication Work Driver");
    
    this.master = master;
    this.conf = master.getConfiguration().getConfiguration();
  }

  @Override
  public void run() {
    while(master.stillMaster()) {
      if (null == workMaker) {
        Connector conn;
        try {
          conn = master.getConnector();
        } catch (AccumuloException|AccumuloSecurityException e) {
          // couldn't get a connector, try again in a "short" amount of time
          log.warn("Error trying to get connector to process replication records", e);
          UtilWaitThread.sleep(2000);
          continue;
        }

        workMaker = new WorkMaker(conn);
      }

      // Tell the work maker to make work
      workMaker.run();

      // Sleep for a bit
      UtilWaitThread.sleep(conf.getTimeInMillis(Property.MASTER_REPLICATION_STATUS_SCAN_INTERVAL));
    }
  }
}