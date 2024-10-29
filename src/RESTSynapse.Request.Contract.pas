unit RESTSynapse.Request.Contract;

{$IFDEF FPC}
  {$mode delphi}
{$ENDIF}

interface

uses RESTSynapse.Response.Contract, RESTSynapse.Request.Adapter.Contract,
    REST.Types,System.SysUtils, System.JSON, System.Classes, Data.DB;

type
  IRequest = interface;

  TRR4DCallbackOnBeforeExecute = reference to procedure(const Req: IRequest);
  TRR4DCallbackOnAfterExecute = reference to procedure(const Req: IRequest; const Res: IResponse);

  IRequest = interface
['{1643C905-CC5B-43FC-8F54-FEAE230596C8}']
    function AcceptEncoding: string; overload;
    function AcceptEncoding(const AAcceptEncoding: string): IRequest; overload;
    function AcceptCharset: string; overload;
    function AcceptCharset(const AAcceptCharset: string): IRequest; overload;
    function Accept: string; overload;
    function Accept(const AAccept: string): IRequest; overload;
    function MimeType: string; overload;
    function MimeType(const AMimeType: string): IRequest; overload;
    function Timeout: Integer; overload;
    function Timeout(const ATimeout: Integer): IRequest; overload;
    function Adapters(const AAdapter: IRequestAdapter): IRequest; overload;
    function Adapters(const AAdapters: TArray<IRequestAdapter>): IRequest; overload;
    function Adapters: TArray<IRequestAdapter>; overload;
    function BaseURL(const ABaseURL: string): IRequest; overload;
    function BaseURL: string; overload;
    function Resource(const AResource: string): IRequest; overload;
    function RaiseExceptionOn500: Boolean; overload;
    function RaiseExceptionOn500(const ARaiseException: Boolean): IRequest; overload;
    function Resource: string; overload;
    function ResourceSuffix(const AResourceSuffix: string): IRequest; overload;
    function ResourceSuffix: string; overload;
    function Token(const AToken: string): IRequest;
    function TokenBearer(const AToken: string): IRequest;
    function BasicAuthentication(const AUsername, APassword: string): IRequest;
    function Retry(const ARetries: Integer): IRequest;
    function OnBeforeExecute(const AOnBeforeExecute: TRR4DCallbackOnBeforeExecute): IRequest;
    function OnAfterExecute(const AOnAfterExecute: TRR4DCallbackOnAfterExecute): IRequest;
    function Get: IResponse;
    function Post: IResponse;
    function Put: IResponse;
    function Delete: IResponse;
    function Patch: IResponse;
    function FullRequestURL(const AIncludeParams: Boolean = True): string;
    function ClearBody: IRequest;
    function AddParam(const AName, AValue: string): IRequest;
    function AddBody(const AContent: string): IRequest; overload;
    function AddHeader(const AName, AValue: string): IRequest;
    function AddBody(const AContent: TJSONObject; const AOwns: Boolean = True): IRequest; overload;
    function AddBody(const AContent: TJSONArray; const AOwns: Boolean = True): IRequest; overload;
    function AddBody(const AContent: TObject; const AOwns: Boolean = True): IRequest; overload;
    function AddBody(const AContent: TStream; const AOwns: Boolean = True): IRequest; overload;
    function AddUrlSegment(const AName, AValue: string): IRequest;
    function ClearHeaders: IRequest;
    function ClearParams: IRequest;
    function UserAgent(const AName: string): IRequest;
    function ContentType(const AContentType: string): IRequest; overload;
    function ContentType: string; overload;
    function AddCookies(const ACookies: TStrings): IRequest;
    function AddCookie(const ACookieName, ACookieValue: string): IRequest;
    function AddField(const AFieldName: string; const AValue: string): IRequest; overload;
    function AddFile(const AFieldName: string; const AFileName: string; const AContentType: string = ''): IRequest; overload;
    function AddFile(const AFieldName: string; const AValue: TStream; const AFileName: string = ''; const AContentType: string = ''): IRequest; overload;
    //Rodolpho
    //function AddFile(const AFileName: string; UploadStrat:THttpUploadStrat): IRequest; overload;
    function Proxy(const AServer, APassword, AUsername: string; const APort: Integer): IRequest;
    function DeactivateProxy: IRequest;
    function CertFile(const APath: string): IRequest;
    function KeyFile(const APath: string): IRequest;
  end;

implementation

end.
