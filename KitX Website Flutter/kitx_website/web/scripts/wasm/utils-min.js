const IsWebAssemblySupportedOnThisBrowser=(()=>{try{if("object"==typeof WebAssembly&&"function"==typeof WebAssembly.instantiate){const e=new WebAssembly.Module(Uint8Array.of(0,97,115,109,1,0,0,0));if(e instanceof WebAssembly.Module)return new WebAssembly.Instance(e)instanceof WebAssembly.Instance}}catch(e){}return!1})();function checkWebAssemblySupport(){return IsWebAssemblySupportedOnThisBrowser}_=checkWebAssemblySupport(),IsWebAssemblySupportedOnThisBrowser||(window.location.href="./sub/wasmerr/index.html");