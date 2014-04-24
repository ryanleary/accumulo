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
package org.apache.accumulo.server.util;

import java.util.UUID;

import org.apache.accumulo.core.data.ColumnUpdate;
import org.apache.accumulo.core.data.KeyExtent;
import org.apache.accumulo.core.data.Mutation;
import org.apache.accumulo.core.protobuf.ProtobufUtil;
import org.apache.accumulo.core.replication.StatusUtil;
import org.apache.accumulo.core.replication.ReplicationSchema.StatusSection;
import org.apache.accumulo.core.replication.proto.Replication.Status;
import org.apache.hadoop.io.Text;
import org.junit.Assert;
import org.junit.Test;

/**
 * 
 */
public class ReplicationTestUtilTest {

  @Test
  public void replEntryMutation() {
    // We stopped using a WAL -- we need a reference that this WAL needs to be replicated completely
    Status stat = StatusUtil.fileClosed();
    String file = "file:///accumulo/wal/127.0.0.1+9997" + UUID.randomUUID();
    Text row = new Text(file);
    KeyExtent extent = new KeyExtent(new Text("1"), new Text("b"), new Text("a"));
    
    Mutation m = ReplicationTableUtil.createUpdateMutation(file, ProtobufUtil.toValue(stat), extent);
    
    Assert.assertEquals(row, new Text(m.getRow()));
    Assert.assertEquals(1, m.getUpdates().size());
    ColumnUpdate col = m.getUpdates().get(0);

    Assert.assertEquals(StatusSection.NAME, new Text(col.getColumnFamily()));
    Assert.assertEquals(extent.getTableId(), new Text(col.getColumnQualifier()));
    Assert.assertEquals(0, col.getColumnVisibility().length);
    Assert.assertArrayEquals(stat.toByteArray(), col.getValue());
  }

}