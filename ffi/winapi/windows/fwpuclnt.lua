require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/sockets' )
local ffi = require( 'ffi' )
ffi.cdef [[
  SocketCode_int WSADeleteSocketPeerTargetName( SOCKET Socket, struct sockaddr* PeerAddr, ULONG PeerAddrLen, LPWSAOVERLAPPED Overlapped, LPWSAOVERLAPPED_COMPLETION_ROUTINE CompletionRoutine);
  SocketCode_int WSAImpersonateSocketPeer(      SOCKET Socket, sockaddr* PeerAddress, ULONG peerAddressLen);
  SocketCode_int WSAQuerySocketSecurity(        SOCKET Socket, SOCKET_SECURITY_QUERY_TEMPLATE* SecurityQueryTemplate, ULONG SecurityQueryTemplateLen, SOCKET_SECURITY_QUERY_INFO* SecurityQueryInfo, ULONG* SecurityQueryInfoLen, LPWSAOVERLAPPED Overlapped, LPWSAOVERLAPPED_COMPLETION_ROUTINE CompletionRoutine);
  SocketCode_int WSARevertImpersonation(        );
  SocketCode_int WSASetSocketPeerTargetName(    SOCKET Socket, SOCKET_PEER_TARGET_NAME* PeerTargetName, ULONG PeerTargetNameLen, LPWSAOVERLAPPED Overlapped, LPWSAOVERLAPPED_COMPLETION_ROUTINE CompletionRoutine);
  SocketCode_int WSASetSocketSecurity(          SOCKET Socket, SOCKET_SECURITY_SETTINGS* SecuritySettings, ULONG SecuritySettingsLen, LPWSAOVERLAPPED Overlapped, LPWSAOVERLAPPED_COMPLETION_ROUTINE CompletionRoutine);
]]
ffi.load( 'Fwpuclnt.dll' )
