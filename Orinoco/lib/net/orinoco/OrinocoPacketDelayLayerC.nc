/* $Id: $ */
/*
 * Copyright (c) 2013 University of Luebeck (UzL).
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * - Redistributions of source code must retain the above copyright
 *   notice, this list of conditions and the following disclaimer.
 * - Redistributions in binary form must reproduce the above copyright
 *   notice, this list of conditions and the following disclaimer in the
 *   documentation and/or other materials provided with the
 *   distribution.
 * - Neither the name of the Hamburg University of Technology nor
 *   the names of its contributors may be used to endorse or promote
 *   products derived from this software without specific prior written
 *   permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 * FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE
 * MASSACHUSETTS INSITIUTE OF TECHNOLOGY OR ITS CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT
 * OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
 * BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
 * USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
  DAMAGE.
 */

/**
 * @author Christian Renner
 * @date April 9th 2013
 */

configuration OrinocoPacketDelayLayerC {
  provides {
    interface AMSend;
    interface Receive;
    interface Packet;
    interface PacketDelay<TMilli> as PacketDelayMilli;
  }
  uses {
    interface AMSend as AMSubSend;
    interface Receive as SubReceive;
    interface Packet as SubPacket;
  }
}
implementation {
  components OrinocoPacketDelayLayerP;
  AMSend           = OrinocoPacketDelayLayerP;
  Receive          = OrinocoPacketDelayLayerP;
  Packet           = OrinocoPacketDelayLayerP;
  PacketDelayMilli = OrinocoPacketDelayLayerP;
  AMSubSend        = OrinocoPacketDelayLayerP;
  SubReceive       = OrinocoPacketDelayLayerP;
  SubPacket        = OrinocoPacketDelayLayerP;

  components LocalTimeMilliC;
  OrinocoPacketDelayLayerP.LocalTimeMilli -> LocalTimeMilliC;
}

