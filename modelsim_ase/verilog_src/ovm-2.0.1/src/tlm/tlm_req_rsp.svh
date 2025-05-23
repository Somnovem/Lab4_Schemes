// $Id: //dvt/mti/rel/6.5b/src/misc/ovm_src/ovm-2.0.1/src/tlm/tlm_req_rsp.svh#1 $
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

//------------------------------------------------------------------------------
//
// CLASS: tlm_req_rsp_channel
//
//------------------------------------------------------------------------------
// tlm_req_rsp_channel contains a request fifo and a response fifo.
// These fifos can be of any size. This channel is particularly useful
// for modeling pipelined protocols.
//------------------------------------------------------------------------------

class tlm_req_rsp_channel #(type REQ=int, type RSP=int) extends ovm_component;

  typedef tlm_req_rsp_channel #(REQ, RSP) this_type;

  const static string type_name = "tlm_req_rsp_channel #(REQ,RSP)";

  ovm_put_export      #(REQ) put_request_export;
  ovm_get_peek_export #(REQ) get_peek_request_export;
  ovm_analysis_port   #(REQ) request_ap;

  ovm_put_export      #(RSP) put_response_export;
  ovm_get_peek_export #(RSP) get_peek_response_export;
  ovm_analysis_port   #(RSP) response_ap;

  ovm_master_imp #(REQ, RSP, this_type, tlm_fifo #(REQ), tlm_fifo #(RSP)) master_export;
  ovm_slave_imp  #(REQ, RSP, this_type, tlm_fifo #(REQ), tlm_fifo #(RSP)) slave_export;

  // port aliases for backward compatibility
  ovm_put_export      #(REQ) blocking_put_request_export,
                             nonblocking_put_request_export;
  ovm_get_peek_export #(REQ) get_request_export,
                             blocking_get_request_export,
                             nonblocking_get_request_export,
                             peek_request_export,
                             blocking_peek_request_export,
                             nonblocking_peek_request_export,
                             blocking_get_peek_request_export,
                             nonblocking_get_peek_request_export;

  ovm_put_export      #(RSP) blocking_put_response_export,
                             nonblocking_put_response_export;
  ovm_get_peek_export #(RSP) get_response_export,
                             blocking_get_response_export,
                             nonblocking_get_response_export,
                             peek_response_export,
                             blocking_peek_response_export,
                             nonblocking_peek_response_export,
                             blocking_get_peek_response_export,
                             nonblocking_get_peek_response_export;

  ovm_master_imp #(REQ, RSP, this_type, tlm_fifo #(REQ), tlm_fifo #(RSP))
                             blocking_master_export, 
                             nonblocking_master_export;

  ovm_slave_imp  #(REQ, RSP, this_type, tlm_fifo #(REQ), tlm_fifo #(RSP))
                             blocking_slave_export, 
                             nonblocking_slave_export;
  // internal fifos
  protected tlm_fifo #(REQ) m_request_fifo;
  protected tlm_fifo #(RSP) m_response_fifo;

  function new (string name, ovm_component parent=null, 
                int request_fifo_size=1,
                int response_fifo_size=1);

    super.new (name, parent);

    m_request_fifo  = new ("request_fifo",  this, request_fifo_size);
    m_response_fifo = new ("response_fifo", this, response_fifo_size);

    request_ap      = new ("request_ap",  this);
    response_ap     = new ("response_ap", this);
            
    put_request_export       = new ("put_request_export",       this);
    get_peek_request_export  = new ("get_peek_request_export",  this);

    put_response_export      = new ("put_response_export",      this); 
    get_peek_response_export = new ("get_peek_response_export", this);

    master_export   = new ("master_export", this, m_request_fifo, m_response_fifo);
    slave_export    = new ("slave_export",  this, m_request_fifo, m_response_fifo);

    create_aliased_exports();

    set_report_id_action_hier(s_connection_error_id, OVM_NO_ACTION);

  endfunction

  virtual function void connect();
    put_request_export.connect       (m_request_fifo.put_export);
    get_peek_request_export.connect  (m_request_fifo.get_peek_export);
    m_request_fifo.put_ap.connect    (request_ap);
    put_response_export.connect      (m_response_fifo.put_export);
    get_peek_response_export.connect (m_response_fifo.get_peek_export);
    m_response_fifo.put_ap.connect   (response_ap);
  endfunction

  function void create_aliased_exports();
    // request
    blocking_put_request_export         = put_request_export;
    nonblocking_put_request_export      = put_request_export;
    get_request_export                  = get_peek_request_export;
    blocking_get_request_export         = get_peek_request_export;
    nonblocking_get_request_export      = get_peek_request_export;
    peek_request_export                 = get_peek_request_export;
    blocking_peek_request_export        = get_peek_request_export;
    nonblocking_peek_request_export     = get_peek_request_export;
    blocking_get_peek_request_export    = get_peek_request_export;
    nonblocking_get_peek_request_export = get_peek_request_export;
  
    // response
    blocking_put_response_export         = put_response_export;
    nonblocking_put_response_export      = put_response_export;
    get_response_export                  = get_peek_response_export;
    blocking_get_response_export         = get_peek_response_export;
    nonblocking_get_response_export      = get_peek_response_export;
    peek_response_export                 = get_peek_response_export;
    blocking_peek_response_export        = get_peek_response_export;
    nonblocking_peek_response_export     = get_peek_response_export;
    blocking_get_peek_response_export    = get_peek_response_export;
    nonblocking_get_peek_response_export = get_peek_response_export;
  
    // master/slave
    blocking_master_export    = master_export; 
    nonblocking_master_export = master_export;
    blocking_slave_export     = slave_export;
    nonblocking_slave_export  = slave_export;
  endfunction
  
  // get_type_name
  // -------------

  function string get_type_name ();
    return type_name;
  endfunction


  // create
  // ------
  
  function ovm_object create (string name=""); 
    this_type v;
    v=new(name);
    return v;
  endfunction


endclass


//------------------------------------------------------------------------------
//
// CLASS: tlm_transport_channel
//
//------------------------------------------------------------------------------
// tlm_transport_channel is a tlm_req_rsp_channel that implements the
// transport interface. Because the requests and responses have a
// tightly coupled one to one relationship, the fifo sizes must be one.
//------------------------------------------------------------------------------

class tlm_transport_channel #(type REQ=int, type RSP=int) 
                                     extends tlm_req_rsp_channel #(REQ, RSP);

  typedef tlm_transport_channel #(REQ, RSP) this_type;

  ovm_transport_imp #(REQ, RSP, this_type) transport_export;

  function new (string name, ovm_component parent=null);
    super.new(name, parent, 1, 1);
    transport_export = new("transport_export", this);
  endfunction

// begin codeblock transport
  task transport( input REQ request , output RSP response );
    this.m_request_fifo.put( request );
    this.m_response_fifo.get( response );
  endtask
// end codeblock transport caption path

  function bit nb_transport( input REQ req, output RSP rsp );
    if(this.m_request_fifo.try_put(req)) 
      return this.m_response_fifo.try_get(rsp);
    else
      return 0;
  endfunction

endclass
