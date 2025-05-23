// $Id: methodology_noparm.svh,v 1.4 2008/07/28 11:50:39 jlrose Exp $
//----------------------------------------------------------------------
//   Copyright 2007-2009 Mentor Graphics Corporation
//   Copyright 2007-2009 Cadence Design Systems, Inc.
//   All Rights Reserved Worldwide
//
//   Licensed under the Apache License, Version 2.0 (the
//   "License"); you may not use this file except in
//   compliance with the License.  You may obtain a copy of
//   the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
//   Unless required by applicable law or agreed to in
//   writing, software distributed under the License is
//   distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
//   CONDITIONS OF ANY KIND, either express or implied.  See
//   the License for the specific language governing
//   permissions and limitations under the License.
//----------------------------------------------------------------------

`ifndef OVM_METH_SVH
`define OVM_METH_SVH

  `include "methodology/sequences/ovm_sequence_item.svh"
  `include "methodology/sequences/ovm_sequencer_base.svh"
  `include "methodology/sequences/ovm_sequence_base.svh"

  `include "methodology/ovm_meth_defines.svh"
  `include "methodology/ovm_monitor.sv"
//  `include "methodology/ovm_driver.svh"
  `include "methodology/ovm_agent.sv"
  `include "methodology/ovm_scoreboard.sv" 
  `include "methodology/ovm_test.sv"

`endif //OVM_METH_SVH
