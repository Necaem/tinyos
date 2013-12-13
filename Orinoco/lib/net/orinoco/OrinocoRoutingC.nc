/* $Id: $ */
/*
 * Copyright (c) 2013 The University of New South Wales (UNSW)
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * - Redistributions of source code must retain the above copyright
 * notice, this list of conditions and the following disclaimer.
 * - Redistributions in binary form must reproduce the above copyright
 * notice, this list of conditions and the following disclaimer in the
 * documentation and/or other materials provided with the
 * distribution.
 * - Neither the name of the University of New South Wales
 * the names of its contributors may be used to endorse or promote
 * products derived from this software without specific prior written
 * permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 * FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
 * UNIVERSITY OF NEW SOUTH WALES OR ITS CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT
 * OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
 * BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
 * USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
 * DAMAGE.
 */

/**
 * Bidirectional routing abstraction.
 *
 * @author Andreas Reinhardt
 * @date August 28, 2013
 */
 
configuration OrinocoRoutingC {
  provides {
    interface OrinocoRoutingRoot;
    interface OrinocoRoutingClient;
    interface OrinocoRoutingInternal;
  }
}
implementation {
  components OrinocoRoutingP;
  OrinocoRoutingRoot = OrinocoRoutingP;
  OrinocoRoutingClient = OrinocoRoutingP;
  OrinocoRoutingInternal = OrinocoRoutingP;
//  SplitControl = OrinocoRoutingP;

  components OrinocoP;
  OrinocoRoutingP.Send -> OrinocoP.Send;
  OrinocoRoutingP.Packet-> OrinocoP;
  
  // DEBUG: Allow timestamping printf() messages
  components LocalTimeMilliC as Clock;
  OrinocoRoutingP.Clock -> Clock;
  
  // To re-calculate hashes on address change
  components ActiveMessageAddressC as Address;
  OrinocoRoutingP.AMA -> Address;
    
  components RandomC;
  OrinocoRoutingP.Random -> RandomC;

  components MainC;
  MainC.SoftwareInit   -> OrinocoRoutingP;
  OrinocoRoutingP.Boot -> MainC;
}
