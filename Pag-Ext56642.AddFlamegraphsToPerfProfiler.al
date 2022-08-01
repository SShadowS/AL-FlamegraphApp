pageextension 56642 "AddFlamegraphsToPerfProfiler" extends "Performance Profiler"
{
    layout
    {
        addafter("Profiling Call Tree")
        {
            group(Flamegraph)
            {
                Caption = 'Flamegraph';
                Visible = FlamegraphVisible;

                // Alternative viewer, can't decide.
                usercontrol(FlamegraphAddIn; FlamegraphControlAddIn)
                {
                    ApplicationArea = All;
                }

                // usercontrol(SVG; "Microsoft.Dynamics.Nav.Client.WebPageViewer")
                // {
                //     ApplicationArea = All;

                //     trigger ControlAddInReady(callbackUrl: Text)
                //     begin
                //         CurrPage.SVG.SetContent('');
                //     end;
                // }
            }
        }
    }

    actions
    {
        addlast(Reporting)
        {
            action(GetFlames)
            {
                Caption = 'Update Flamegraph';
                Description = 'Uploads .alcpuprofile to webservice and get SVG back.';
                Image = UpdateDescription;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    FlamegraphMgt: codeunit "Flamegraph Mgt.";
                    UploadedFileName: Text;
                    FileContentInstream: Instream;
                    FileContent: Text;
                    FileData: Text;
                begin
                    if not UploadIntoStream(UploadProfileLbl, '', ProfileFileTypeTxt, UploadedFileName, FileContentInstream) then
                        exit;
                    WHILE NOT FileContentInstream.EOS DO begin
                        FileContentInstream.ReadText(FileContent);
                        FileData += FileContent;
                    end;

                    Flamegraph := FlamegraphMgt.GetFlamegraph(FileData);
                    FlamegraphVisible := Flamegraph <> '';
                    //CurrPage.SVG.SetContent(Flamegraph);
                    CurrPage.FlamegraphAddIn.SetContent(Flamegraph);
                    if Flamegraph = '' then
                        Error('Flamegraph is empty.');
                end;
            }
        }
    }

    var
        UploadProfileLbl: Label 'Upload a previously recorded performance profile';
        ProfileFileTypeTxt: Label 'CPU profile |*.alcpuprofile';
        Flamegraph: Text;
        FlamegraphVisible: Boolean;
}
