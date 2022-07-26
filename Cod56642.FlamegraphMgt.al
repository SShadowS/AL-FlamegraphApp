/// <summary>
/// Codeunit Flamegraph Mgt. (ID 56642).
/// </summary>
codeunit 56642 "Flamegraph Mgt."
{
    /// <summary>
    /// Gets the Base64 encoded flamegraph from webserver, based on a supplied .alcpuprofile file.
    /// </summary>
    /// <param name="ALCPUProfile">The .alcpuprofile file as a Text</param>
    /// <returns>Returns the flamegraph as Base64 Encoded of type Text.</returns>
    procedure GetFlamegraph(ALCPUProfile: Text) Base64Encoded: Text;
    var
        HTTP: HTTPClient;
        Response: HttpResponseMessage;
        Content: HttpContent;
        URL: Text;
    begin
        URL := 'http://blogapi.sshadows.dk/upload';
        //URL := 'http://192.168.2.77:5000/upload'; // For local testing
        Content.WriteFrom(ALCPUProfile);
        if Http.Post(URL, Content, Response) then begin
            case Response.HttpStatusCode of
                200:
                    Response.Content.ReadAs(Base64Encoded);
                else
                    Error('An error occurred while trying to get the flamegraph.');
            end;
        end else begin
            Error('Failed to post to flamegraph server');
        end;
    end;
}
