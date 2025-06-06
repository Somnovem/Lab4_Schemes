// $Id: //dvt/mti/rel/6.5b/src/misc/ovm_src/ovm-2.0.1/src/methodology/ovm_monitor.sv#1 $
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

`include "methodology/ovm_monitor.svh"

//------------------------------------------------------------------------------
//
// CLASS: ovm_monitor
//
// implementation
//------------------------------------------------------------------------------

// new
// ---

function ovm_monitor::new (string name, ovm_component parent);
  super.new(name, parent);
endfunction

