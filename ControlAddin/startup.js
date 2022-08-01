// Thanks AJ.
var iframe = window.frameElement;

iframe.parentElement.style.display = 'flex';
iframe.parentElement.style.flexDirection = 'column';
iframe.parentElement.style.flexGrow = '1';

iframe.style.removeProperty('height');
iframe.style.removeProperty('min-height');
iframe.style.removeProperty('max-height');

iframe.style.flexGrow = '1';
iframe.style.flexShrink = '1';
iframe.style.flexBasis = 'auto';
iframe.style.paddingBottom = '42px';
iframe.style.height = '442px';

var controlAddIn = document.getElementById('controlAddIn');
var Base64Encoded = '';
var AwesomeSVG = atob(Base64Encoded);
controlAddIn.outerHTML = AwesomeSVG;