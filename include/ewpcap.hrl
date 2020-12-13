%% Copyright (c) 2012-2014, Michael Santos <michael.santos@gmail.com>
%% All rights reserved.
%%
%% Redistribution and use in source and binary forms, with or without
%% modification, are permitted provided that the following conditions
%% are met:
%%
%% Redistributions of source code must retain the above copyright
%% notice, this list of conditions and the following disclaimer.
%%
%% Redistributions in binary form must reproduce the above copyright
%% notice, this list of conditions and the following disclaimer in the
%% documentation and/or other materials provided with the distribution.
%%
%% Neither the name of the author nor the names of its contributors
%% may be used to endorse or promote products derived from this software
%% without specific prior written permission.
%%
%% THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
%% "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
%% LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
%% FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
%% COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
%% INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
%% BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
%% LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
%% CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
%% LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
%% ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
%% POSSIBILITY OF SUCH DAMAGE.

% Packet format in message
-record(ewpcap, {
    % socket identifier
    ref :: reference(),
    % datalink type
    dlt :: integer(),
    time ::
        {non_neg_integer(), non_neg_integer(), non_neg_integer()}
        | non_neg_integer(),
    % time: {MegaSecs, Secs, MicroSecs}
    %       | microseconds

    % actual packet length
    length :: non_neg_integer(),
    %  (data may be truncated)

    % packet
    packet :: binary()
}).

-record(ewpcap_resource, {
    ref :: reference(),
    res :: any()
}).

-record(ewpcap_stat, {
    % number of packets received
    recv :: integer(),
    % number of packets dropped
    drop :: integer(),
    % number of packets dropped by interface
    ifdrop :: integer(),
    % Win32: number of packets that reach
    capt :: integer()
    %  the application
}).
