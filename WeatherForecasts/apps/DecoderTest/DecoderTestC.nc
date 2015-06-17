/* $Id: $ */
/*
 * Copyright (c) 2015 Universität zu Lübeck (UzL).
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
 * Universität zu Lübeck OR ITS CONTRIBUTORS BE LIABLE
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
 * @author Christian Renner
 */

/**
 * @author Christian Renner
 * @date December 14 2011
 */
/*
#ifdef USE_PRINTF
  #define NEW_PRINTF_SEMANTICS
  #include "printf.h"
#endif*/
#include "DdcForecastMsg.h"
#include "printf.h"

configuration DecoderTestC {
}
implementation {
  components DecoderTestP;
  
  components MainC;
  DecoderTestP.Boot -> MainC;
  
  components LocalTimeMicroC;
  DecoderTestP.LocalTime -> LocalTimeMicroC;


// NEU
// Receive Package
  components new AMSenderC(AM_DDC_FORECAST_MSG);
  components new AMReceiverC(AM_DDC_FORECAST_MSG);
  components ActiveMessageC;
  DecoderTestP.AMControl      -> ActiveMessageC;
  DecoderTestP.Receive 		-> AMReceiverC;
  DecoderTestP.AMSend 		-> AMSenderC;
  DecoderTestP.Packet 		-> AMSenderC;
//-------------------------------------

  
  components DdcDecoderC;
  DecoderTestP.Decoder -> DdcDecoderC;

  
  
  // printf
  components PrintfC;
  components SerialStartC;
}
