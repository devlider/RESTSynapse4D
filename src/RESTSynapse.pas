unit RESTSynapse;

interface

uses
  {$IF NOT (DEFINED(RR4D_INDY) or DEFINED(FPC) or DEFINED(RR4D_NETHTTP))}
    REST.Types,
  {$ENDIF}
  RESTSynapse.Request.Contract, RESTSynapse.Response.Contract, RESTSynapse.Request.Adapter.Contract;

type
  IRequest = RESTSynapse.Request.Contract.IRequest;
  IRequestAdapter = RESTSynapse.Request.Adapter.Contract.IRequestAdapter;
  IResponse = RESTSynapse.Response.Contract.IResponse;

  TRequest = class
  public
    class function New: IRequest;
  end;

{$IF NOT (DEFINED(RR4D_INDY) or DEFINED(FPC) or DEFINED(RR4D_NETHTTP))}
const
  poDoNotEncode = REST.Types.poDoNotEncode;
  poTransient = REST.Types.poTransient;
  poAutoCreated = REST.Types.poAutoCreated;
  {$IF COMPILERVERSION >= 33}
    poFlatArray = REST.Types.poFlatArray;
    poPHPArray = REST.Types.poPHPArray;
    poListArray = REST.Types.poListArray;
  {$ENDIF}

  pkCOOKIE = REST.Types.pkCOOKIE;
  pkGETorPOST = REST.Types.pkGETorPOST;
  pkURLSEGMENT = REST.Types.pkURLSEGMENT;
  pkHTTPHEADER = REST.Types.pkHTTPHEADER;
  pkREQUESTBODY = REST.Types.pkREQUESTBODY;
  {$IF COMPILERVERSION >= 32}
    pkFILE = REST.Types.pkFILE;
  {$ENDIF}
  {$IF COMPILERVERSION >= 33}
    pkQUERY = REST.Types.pkQUERY;
  {$ENDIF}
{$ENDIF}

implementation

uses
    RESTSynapse.Request.Synapse;

class function TRequest.New: IRequest;
begin
  Result := TRequestSynapse.New;
end;

end.