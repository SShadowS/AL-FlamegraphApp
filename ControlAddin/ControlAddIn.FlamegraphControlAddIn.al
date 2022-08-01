controladdin "FlamegraphControlAddIn"
{
    StartupScript = './ControlAddin/startup.js';
    StyleSheets = './ControlAddIn/stylesheet.css';
    Scripts = './ControlAddIn/main.js';

    HorizontalStretch = true;
    HorizontalShrink = true;
    MinimumWidth = 250;

    procedure SetContent(i: text);
}