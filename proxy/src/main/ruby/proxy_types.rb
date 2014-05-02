# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Autogenerated by Thrift Compiler (0.9.1)
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#

require 'thrift'

module Accumulo
  module PartialKey
    ROW = 0
    ROW_COLFAM = 1
    ROW_COLFAM_COLQUAL = 2
    ROW_COLFAM_COLQUAL_COLVIS = 3
    ROW_COLFAM_COLQUAL_COLVIS_TIME = 4
    ROW_COLFAM_COLQUAL_COLVIS_TIME_DEL = 5
    VALUE_MAP = {0 => "ROW", 1 => "ROW_COLFAM", 2 => "ROW_COLFAM_COLQUAL", 3 => "ROW_COLFAM_COLQUAL_COLVIS", 4 => "ROW_COLFAM_COLQUAL_COLVIS_TIME", 5 => "ROW_COLFAM_COLQUAL_COLVIS_TIME_DEL"}
    VALID_VALUES = Set.new([ROW, ROW_COLFAM, ROW_COLFAM_COLQUAL, ROW_COLFAM_COLQUAL_COLVIS, ROW_COLFAM_COLQUAL_COLVIS_TIME, ROW_COLFAM_COLQUAL_COLVIS_TIME_DEL]).freeze
  end

  module TablePermission
    READ = 2
    WRITE = 3
    BULK_IMPORT = 4
    ALTER_TABLE = 5
    GRANT = 6
    DROP_TABLE = 7
    VALUE_MAP = {2 => "READ", 3 => "WRITE", 4 => "BULK_IMPORT", 5 => "ALTER_TABLE", 6 => "GRANT", 7 => "DROP_TABLE"}
    VALID_VALUES = Set.new([READ, WRITE, BULK_IMPORT, ALTER_TABLE, GRANT, DROP_TABLE]).freeze
  end

  module SystemPermission
    GRANT = 0
    CREATE_TABLE = 1
    DROP_TABLE = 2
    ALTER_TABLE = 3
    CREATE_USER = 4
    DROP_USER = 5
    ALTER_USER = 6
    SYSTEM = 7
    VALUE_MAP = {0 => "GRANT", 1 => "CREATE_TABLE", 2 => "DROP_TABLE", 3 => "ALTER_TABLE", 4 => "CREATE_USER", 5 => "DROP_USER", 6 => "ALTER_USER", 7 => "SYSTEM"}
    VALID_VALUES = Set.new([GRANT, CREATE_TABLE, DROP_TABLE, ALTER_TABLE, CREATE_USER, DROP_USER, ALTER_USER, SYSTEM]).freeze
  end

  module ScanType
    SINGLE = 0
    BATCH = 1
    VALUE_MAP = {0 => "SINGLE", 1 => "BATCH"}
    VALID_VALUES = Set.new([SINGLE, BATCH]).freeze
  end

  module ScanState
    IDLE = 0
    RUNNING = 1
    QUEUED = 2
    VALUE_MAP = {0 => "IDLE", 1 => "RUNNING", 2 => "QUEUED"}
    VALID_VALUES = Set.new([IDLE, RUNNING, QUEUED]).freeze
  end

  module ConditionalStatus
    ACCEPTED = 0
    REJECTED = 1
    VIOLATED = 2
    UNKNOWN = 3
    INVISIBLE_VISIBILITY = 4
    VALUE_MAP = {0 => "ACCEPTED", 1 => "REJECTED", 2 => "VIOLATED", 3 => "UNKNOWN", 4 => "INVISIBLE_VISIBILITY"}
    VALID_VALUES = Set.new([ACCEPTED, REJECTED, VIOLATED, UNKNOWN, INVISIBLE_VISIBILITY]).freeze
  end

  module CompactionType
    MINOR = 0
    MERGE = 1
    MAJOR = 2
    FULL = 3
    VALUE_MAP = {0 => "MINOR", 1 => "MERGE", 2 => "MAJOR", 3 => "FULL"}
    VALID_VALUES = Set.new([MINOR, MERGE, MAJOR, FULL]).freeze
  end

  module CompactionReason
    USER = 0
    SYSTEM = 1
    CHOP = 2
    IDLE = 3
    CLOSE = 4
    VALUE_MAP = {0 => "USER", 1 => "SYSTEM", 2 => "CHOP", 3 => "IDLE", 4 => "CLOSE"}
    VALID_VALUES = Set.new([USER, SYSTEM, CHOP, IDLE, CLOSE]).freeze
  end

  module IteratorScope
    MINC = 0
    MAJC = 1
    SCAN = 2
    VALUE_MAP = {0 => "MINC", 1 => "MAJC", 2 => "SCAN"}
    VALID_VALUES = Set.new([MINC, MAJC, SCAN]).freeze
  end

  module TimeType
    LOGICAL = 0
    MILLIS = 1
    VALUE_MAP = {0 => "LOGICAL", 1 => "MILLIS"}
    VALID_VALUES = Set.new([LOGICAL, MILLIS]).freeze
  end

  class Key
    include ::Thrift::Struct, ::Thrift::Struct_Union
    ROW = 1
    COLFAMILY = 2
    COLQUALIFIER = 3
    COLVISIBILITY = 4
    TIMESTAMP = 5

    FIELDS = {
      ROW => {:type => ::Thrift::Types::STRING, :name => 'row', :binary => true},
      COLFAMILY => {:type => ::Thrift::Types::STRING, :name => 'colFamily', :binary => true},
      COLQUALIFIER => {:type => ::Thrift::Types::STRING, :name => 'colQualifier', :binary => true},
      COLVISIBILITY => {:type => ::Thrift::Types::STRING, :name => 'colVisibility', :binary => true},
      TIMESTAMP => {:type => ::Thrift::Types::I64, :name => 'timestamp', :default => 9223372036854775807, :optional => true}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class ColumnUpdate
    include ::Thrift::Struct, ::Thrift::Struct_Union
    COLFAMILY = 1
    COLQUALIFIER = 2
    COLVISIBILITY = 3
    TIMESTAMP = 4
    VALUE = 5
    DELETECELL = 6

    FIELDS = {
      COLFAMILY => {:type => ::Thrift::Types::STRING, :name => 'colFamily', :binary => true},
      COLQUALIFIER => {:type => ::Thrift::Types::STRING, :name => 'colQualifier', :binary => true},
      COLVISIBILITY => {:type => ::Thrift::Types::STRING, :name => 'colVisibility', :binary => true, :optional => true},
      TIMESTAMP => {:type => ::Thrift::Types::I64, :name => 'timestamp', :optional => true},
      VALUE => {:type => ::Thrift::Types::STRING, :name => 'value', :binary => true, :optional => true},
      DELETECELL => {:type => ::Thrift::Types::BOOL, :name => 'deleteCell', :optional => true}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class DiskUsage
    include ::Thrift::Struct, ::Thrift::Struct_Union
    TABLES = 1
    USAGE = 2

    FIELDS = {
      TABLES => {:type => ::Thrift::Types::LIST, :name => 'tables', :element => {:type => ::Thrift::Types::STRING}},
      USAGE => {:type => ::Thrift::Types::I64, :name => 'usage'}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class KeyValue
    include ::Thrift::Struct, ::Thrift::Struct_Union
    KEY = 1
    VALUE = 2

    FIELDS = {
      KEY => {:type => ::Thrift::Types::STRUCT, :name => 'key', :class => ::Accumulo::Key},
      VALUE => {:type => ::Thrift::Types::STRING, :name => 'value', :binary => true}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class ScanResult
    include ::Thrift::Struct, ::Thrift::Struct_Union
    RESULTS = 1
    MORE = 2

    FIELDS = {
      RESULTS => {:type => ::Thrift::Types::LIST, :name => 'results', :element => {:type => ::Thrift::Types::STRUCT, :class => ::Accumulo::KeyValue}},
      MORE => {:type => ::Thrift::Types::BOOL, :name => 'more'}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class Range
    include ::Thrift::Struct, ::Thrift::Struct_Union
    START = 1
    STARTINCLUSIVE = 2
    STOP = 3
    STOPINCLUSIVE = 4

    FIELDS = {
      START => {:type => ::Thrift::Types::STRUCT, :name => 'start', :class => ::Accumulo::Key},
      STARTINCLUSIVE => {:type => ::Thrift::Types::BOOL, :name => 'startInclusive'},
      STOP => {:type => ::Thrift::Types::STRUCT, :name => 'stop', :class => ::Accumulo::Key},
      STOPINCLUSIVE => {:type => ::Thrift::Types::BOOL, :name => 'stopInclusive'}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class ScanColumn
    include ::Thrift::Struct, ::Thrift::Struct_Union
    COLFAMILY = 1
    COLQUALIFIER = 2

    FIELDS = {
      COLFAMILY => {:type => ::Thrift::Types::STRING, :name => 'colFamily', :binary => true},
      COLQUALIFIER => {:type => ::Thrift::Types::STRING, :name => 'colQualifier', :binary => true, :optional => true}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class IteratorSetting
    include ::Thrift::Struct, ::Thrift::Struct_Union
    PRIORITY = 1
    NAME = 2
    ITERATORCLASS = 3
    PROPERTIES = 4

    FIELDS = {
      PRIORITY => {:type => ::Thrift::Types::I32, :name => 'priority'},
      NAME => {:type => ::Thrift::Types::STRING, :name => 'name'},
      ITERATORCLASS => {:type => ::Thrift::Types::STRING, :name => 'iteratorClass'},
      PROPERTIES => {:type => ::Thrift::Types::MAP, :name => 'properties', :key => {:type => ::Thrift::Types::STRING}, :value => {:type => ::Thrift::Types::STRING}}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class ScanOptions
    include ::Thrift::Struct, ::Thrift::Struct_Union
    AUTHORIZATIONS = 1
    RANGE = 2
    COLUMNS = 3
    ITERATORS = 4
    BUFFERSIZE = 5

    FIELDS = {
      AUTHORIZATIONS => {:type => ::Thrift::Types::SET, :name => 'authorizations', :element => {:type => ::Thrift::Types::STRING, :binary => true}, :optional => true},
      RANGE => {:type => ::Thrift::Types::STRUCT, :name => 'range', :class => ::Accumulo::Range, :optional => true},
      COLUMNS => {:type => ::Thrift::Types::LIST, :name => 'columns', :element => {:type => ::Thrift::Types::STRUCT, :class => ::Accumulo::ScanColumn}, :optional => true},
      ITERATORS => {:type => ::Thrift::Types::LIST, :name => 'iterators', :element => {:type => ::Thrift::Types::STRUCT, :class => ::Accumulo::IteratorSetting}, :optional => true},
      BUFFERSIZE => {:type => ::Thrift::Types::I32, :name => 'bufferSize', :optional => true}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class BatchScanOptions
    include ::Thrift::Struct, ::Thrift::Struct_Union
    AUTHORIZATIONS = 1
    RANGES = 2
    COLUMNS = 3
    ITERATORS = 4
    THREADS = 5

    FIELDS = {
      AUTHORIZATIONS => {:type => ::Thrift::Types::SET, :name => 'authorizations', :element => {:type => ::Thrift::Types::STRING, :binary => true}, :optional => true},
      RANGES => {:type => ::Thrift::Types::LIST, :name => 'ranges', :element => {:type => ::Thrift::Types::STRUCT, :class => ::Accumulo::Range}, :optional => true},
      COLUMNS => {:type => ::Thrift::Types::LIST, :name => 'columns', :element => {:type => ::Thrift::Types::STRUCT, :class => ::Accumulo::ScanColumn}, :optional => true},
      ITERATORS => {:type => ::Thrift::Types::LIST, :name => 'iterators', :element => {:type => ::Thrift::Types::STRUCT, :class => ::Accumulo::IteratorSetting}, :optional => true},
      THREADS => {:type => ::Thrift::Types::I32, :name => 'threads', :optional => true}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class KeyValueAndPeek
    include ::Thrift::Struct, ::Thrift::Struct_Union
    KEYVALUE = 1
    HASNEXT = 2

    FIELDS = {
      KEYVALUE => {:type => ::Thrift::Types::STRUCT, :name => 'keyValue', :class => ::Accumulo::KeyValue},
      HASNEXT => {:type => ::Thrift::Types::BOOL, :name => 'hasNext'}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class KeyExtent
    include ::Thrift::Struct, ::Thrift::Struct_Union
    TABLEID = 1
    ENDROW = 2
    PREVENDROW = 3

    FIELDS = {
      TABLEID => {:type => ::Thrift::Types::STRING, :name => 'tableId'},
      ENDROW => {:type => ::Thrift::Types::STRING, :name => 'endRow', :binary => true},
      PREVENDROW => {:type => ::Thrift::Types::STRING, :name => 'prevEndRow', :binary => true}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class Column
    include ::Thrift::Struct, ::Thrift::Struct_Union
    COLFAMILY = 1
    COLQUALIFIER = 2
    COLVISIBILITY = 3

    FIELDS = {
      COLFAMILY => {:type => ::Thrift::Types::STRING, :name => 'colFamily', :binary => true},
      COLQUALIFIER => {:type => ::Thrift::Types::STRING, :name => 'colQualifier', :binary => true},
      COLVISIBILITY => {:type => ::Thrift::Types::STRING, :name => 'colVisibility', :binary => true}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class Condition
    include ::Thrift::Struct, ::Thrift::Struct_Union
    COLUMN = 1
    TIMESTAMP = 2
    VALUE = 3
    ITERATORS = 4

    FIELDS = {
      COLUMN => {:type => ::Thrift::Types::STRUCT, :name => 'column', :class => ::Accumulo::Column},
      TIMESTAMP => {:type => ::Thrift::Types::I64, :name => 'timestamp', :optional => true},
      VALUE => {:type => ::Thrift::Types::STRING, :name => 'value', :binary => true, :optional => true},
      ITERATORS => {:type => ::Thrift::Types::LIST, :name => 'iterators', :element => {:type => ::Thrift::Types::STRUCT, :class => ::Accumulo::IteratorSetting}, :optional => true}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class ConditionalUpdates
    include ::Thrift::Struct, ::Thrift::Struct_Union
    CONDITIONS = 2
    UPDATES = 3

    FIELDS = {
      CONDITIONS => {:type => ::Thrift::Types::LIST, :name => 'conditions', :element => {:type => ::Thrift::Types::STRUCT, :class => ::Accumulo::Condition}},
      UPDATES => {:type => ::Thrift::Types::LIST, :name => 'updates', :element => {:type => ::Thrift::Types::STRUCT, :class => ::Accumulo::ColumnUpdate}}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class ConditionalWriterOptions
    include ::Thrift::Struct, ::Thrift::Struct_Union
    MAXMEMORY = 1
    TIMEOUTMS = 2
    THREADS = 3
    AUTHORIZATIONS = 4

    FIELDS = {
      MAXMEMORY => {:type => ::Thrift::Types::I64, :name => 'maxMemory', :optional => true},
      TIMEOUTMS => {:type => ::Thrift::Types::I64, :name => 'timeoutMs', :optional => true},
      THREADS => {:type => ::Thrift::Types::I32, :name => 'threads', :optional => true},
      AUTHORIZATIONS => {:type => ::Thrift::Types::SET, :name => 'authorizations', :element => {:type => ::Thrift::Types::STRING, :binary => true}, :optional => true}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class ActiveScan
    include ::Thrift::Struct, ::Thrift::Struct_Union
    CLIENT = 1
    USER = 2
    TABLE = 3
    AGE = 4
    IDLETIME = 5
    TYPE = 6
    STATE = 7
    EXTENT = 8
    COLUMNS = 9
    ITERATORS = 10
    AUTHORIZATIONS = 11

    FIELDS = {
      CLIENT => {:type => ::Thrift::Types::STRING, :name => 'client'},
      USER => {:type => ::Thrift::Types::STRING, :name => 'user'},
      TABLE => {:type => ::Thrift::Types::STRING, :name => 'table'},
      AGE => {:type => ::Thrift::Types::I64, :name => 'age'},
      IDLETIME => {:type => ::Thrift::Types::I64, :name => 'idleTime'},
      TYPE => {:type => ::Thrift::Types::I32, :name => 'type', :enum_class => ::Accumulo::ScanType},
      STATE => {:type => ::Thrift::Types::I32, :name => 'state', :enum_class => ::Accumulo::ScanState},
      EXTENT => {:type => ::Thrift::Types::STRUCT, :name => 'extent', :class => ::Accumulo::KeyExtent},
      COLUMNS => {:type => ::Thrift::Types::LIST, :name => 'columns', :element => {:type => ::Thrift::Types::STRUCT, :class => ::Accumulo::Column}},
      ITERATORS => {:type => ::Thrift::Types::LIST, :name => 'iterators', :element => {:type => ::Thrift::Types::STRUCT, :class => ::Accumulo::IteratorSetting}},
      AUTHORIZATIONS => {:type => ::Thrift::Types::LIST, :name => 'authorizations', :element => {:type => ::Thrift::Types::STRING, :binary => true}}
    }

    def struct_fields; FIELDS; end

    def validate
      unless @type.nil? || ::Accumulo::ScanType::VALID_VALUES.include?(@type)
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Invalid value of field type!')
      end
      unless @state.nil? || ::Accumulo::ScanState::VALID_VALUES.include?(@state)
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Invalid value of field state!')
      end
    end

    ::Thrift::Struct.generate_accessors self
  end

  class ActiveCompaction
    include ::Thrift::Struct, ::Thrift::Struct_Union
    EXTENT = 1
    AGE = 2
    INPUTFILES = 3
    OUTPUTFILE = 4
    TYPE = 5
    REASON = 6
    LOCALITYGROUP = 7
    ENTRIESREAD = 8
    ENTRIESWRITTEN = 9
    ITERATORS = 10

    FIELDS = {
      EXTENT => {:type => ::Thrift::Types::STRUCT, :name => 'extent', :class => ::Accumulo::KeyExtent},
      AGE => {:type => ::Thrift::Types::I64, :name => 'age'},
      INPUTFILES => {:type => ::Thrift::Types::LIST, :name => 'inputFiles', :element => {:type => ::Thrift::Types::STRING}},
      OUTPUTFILE => {:type => ::Thrift::Types::STRING, :name => 'outputFile'},
      TYPE => {:type => ::Thrift::Types::I32, :name => 'type', :enum_class => ::Accumulo::CompactionType},
      REASON => {:type => ::Thrift::Types::I32, :name => 'reason', :enum_class => ::Accumulo::CompactionReason},
      LOCALITYGROUP => {:type => ::Thrift::Types::STRING, :name => 'localityGroup'},
      ENTRIESREAD => {:type => ::Thrift::Types::I64, :name => 'entriesRead'},
      ENTRIESWRITTEN => {:type => ::Thrift::Types::I64, :name => 'entriesWritten'},
      ITERATORS => {:type => ::Thrift::Types::LIST, :name => 'iterators', :element => {:type => ::Thrift::Types::STRUCT, :class => ::Accumulo::IteratorSetting}}
    }

    def struct_fields; FIELDS; end

    def validate
      unless @type.nil? || ::Accumulo::CompactionType::VALID_VALUES.include?(@type)
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Invalid value of field type!')
      end
      unless @reason.nil? || ::Accumulo::CompactionReason::VALID_VALUES.include?(@reason)
        raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Invalid value of field reason!')
      end
    end

    ::Thrift::Struct.generate_accessors self
  end

  class WriterOptions
    include ::Thrift::Struct, ::Thrift::Struct_Union
    MAXMEMORY = 1
    LATENCYMS = 2
    TIMEOUTMS = 3
    THREADS = 4

    FIELDS = {
      MAXMEMORY => {:type => ::Thrift::Types::I64, :name => 'maxMemory'},
      LATENCYMS => {:type => ::Thrift::Types::I64, :name => 'latencyMs'},
      TIMEOUTMS => {:type => ::Thrift::Types::I64, :name => 'timeoutMs'},
      THREADS => {:type => ::Thrift::Types::I32, :name => 'threads'}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class UnknownScanner < ::Thrift::Exception
    include ::Thrift::Struct, ::Thrift::Struct_Union
    def initialize(message=nil)
      super()
      self.msg = message
    end

    def message; msg end

    MSG = 1

    FIELDS = {
      MSG => {:type => ::Thrift::Types::STRING, :name => 'msg'}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class UnknownWriter < ::Thrift::Exception
    include ::Thrift::Struct, ::Thrift::Struct_Union
    def initialize(message=nil)
      super()
      self.msg = message
    end

    def message; msg end

    MSG = 1

    FIELDS = {
      MSG => {:type => ::Thrift::Types::STRING, :name => 'msg'}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class NoMoreEntriesException < ::Thrift::Exception
    include ::Thrift::Struct, ::Thrift::Struct_Union
    def initialize(message=nil)
      super()
      self.msg = message
    end

    def message; msg end

    MSG = 1

    FIELDS = {
      MSG => {:type => ::Thrift::Types::STRING, :name => 'msg'}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class AccumuloException < ::Thrift::Exception
    include ::Thrift::Struct, ::Thrift::Struct_Union
    def initialize(message=nil)
      super()
      self.msg = message
    end

    def message; msg end

    MSG = 1

    FIELDS = {
      MSG => {:type => ::Thrift::Types::STRING, :name => 'msg'}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class AccumuloSecurityException < ::Thrift::Exception
    include ::Thrift::Struct, ::Thrift::Struct_Union
    def initialize(message=nil)
      super()
      self.msg = message
    end

    def message; msg end

    MSG = 1

    FIELDS = {
      MSG => {:type => ::Thrift::Types::STRING, :name => 'msg'}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class TableNotFoundException < ::Thrift::Exception
    include ::Thrift::Struct, ::Thrift::Struct_Union
    def initialize(message=nil)
      super()
      self.msg = message
    end

    def message; msg end

    MSG = 1

    FIELDS = {
      MSG => {:type => ::Thrift::Types::STRING, :name => 'msg'}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class TableExistsException < ::Thrift::Exception
    include ::Thrift::Struct, ::Thrift::Struct_Union
    def initialize(message=nil)
      super()
      self.msg = message
    end

    def message; msg end

    MSG = 1

    FIELDS = {
      MSG => {:type => ::Thrift::Types::STRING, :name => 'msg'}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class MutationsRejectedException < ::Thrift::Exception
    include ::Thrift::Struct, ::Thrift::Struct_Union
    def initialize(message=nil)
      super()
      self.msg = message
    end

    def message; msg end

    MSG = 1

    FIELDS = {
      MSG => {:type => ::Thrift::Types::STRING, :name => 'msg'}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

end
