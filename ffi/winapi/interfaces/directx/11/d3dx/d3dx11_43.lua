local ffi = require( 'ffi' )
ffi.cdef [[
  HRESULT D3DX11CompileFromFile(                        LPCTSTR pSrcFile, const D3D10_SHADER_MACRO* pDefines, LPD3D10INCLUDE pInclude, LPCSTR pFunctionName, LPCSTR pProfile, WINAPI_D3D10_SHADER Flags1, WINAPI_D3D10_EFFECT Flags2, ID3DX11ThreadPump* pPump, ID3D10Blob** ppShader, ID3D10Blob** ppErrorMsgs, HRESULT* pHResult);
  HRESULT D3DX11CompileFromMemory(                      LPCSTR pSrcData, SIZE_T SrcDataLen, LPCSTR pFileName, const D3D10_SHADER_MACRO* pDefines, LPD3D10INCLUDE pInclude, LPCSTR pFunctionName, LPCSTR pProfile, UINT Flags1, UINT Flags2, ID3DX11ThreadPump* pPump, ID3D10Blob** ppShader, ID3D10Blob** ppErrorMsgs, HRESULT* pHResult);
  HRESULT D3DX11CompileFromResource(                    HMODULE hSrcModule, LPCTSTR pSrcResource, LPCTSTR pSrcFileName, const D3D10_SHADER_MACRO* pDefines, LPD3D10INCLUDE pInclude, LPCSTR pFunctionName, LPCSTR pProfile, UINT Flags1, UINT Flags2, ID3DX11ThreadPump* pPump, ID3D10Blob** ppShader, ID3D10Blob** ppErrorMsgs, HRESULT* pHResult);
  HRESULT D3DX11ComputeNormalMap(                       ID3D11DeviceContext* pContext, ID3D11Texture2D* pSrcTexture, WINAPI_D3DX_NORMALMAP Flags, UINT Channel, FLOAT Amplitude, ID3D11Texture2D* pDestTexture);
  HRESULT D3DX11CreateAsyncCompilerProcessor(           LPCSTR pFileName, const D3D11_SHADER_MACRO* pDefines, LPD3D10INCLUDE pInclude, LPCSTR pFunctionName, LPCSTR pProfile, UINT Flags1, UINT Flags2, ID3D10Blob** ppCompiledShader, ID3D10Blob** ppErrorBuffer, ID3DX11DataProcessor** ppDataProcessor);
  HRESULT D3DX11CreateAsyncFileLoader(                  LPCTSTR pFileName, ID3DX11DataLoader** ppDataLoader);
  HRESULT D3DX11CreateAsyncMemoryLoader(                LPCVOID pData, SIZE_T cbData, ID3DX11DataLoader** ppDataLoader);
  HRESULT D3DX11CreateAsyncResourceLoader(              HMODULE hSrcModule, LPCTSTR pSrcResource, ID3DX11DataLoader** ppDataLoader);
  HRESULT D3DX11CreateAsyncShaderPreprocessProcessor(   LPCSTR pFileName, const D3D11_SHADER_MACRO* pDefines, LPD3D10INCLUDE pInclude, ID3D10Blob** ppShaderText, ID3D10Blob** ppErrorBuffer, ID3DX11DataProcessor** ppDataProcessor);
  HRESULT D3DX11CreateAsyncShaderResourceViewProcessor( ID3D11Device* pDevice, D3DX11_IMAGE_LOAD_INFO* pLoadInfo, ID3DX11DataProcessor** ppDataProcessor);
  HRESULT D3DX11CreateAsyncTextureInfoProcessor(        D3DX11_IMAGE_INFO* pImageInfo, ID3DX11DataProcessor** ppDataProcessor);
  HRESULT D3DX11CreateAsyncTextureProcessor(            ID3D11Device* pDevice, D3DX11_IMAGE_LOAD_INFO* pLoadInfo, ID3DX11DataProcessor** ppDataProcessor);
  HRESULT D3DX11CreateShaderResourceViewFromFile(       ID3D11Device* pDevice, LPCTSTR pSrcFile, D3DX11_IMAGE_LOAD_INFO* pLoadInfo, ID3DX11ThreadPump* pPump, ID3D11ShaderResourceView** ppShaderResourceView, HRESULT* pHResult);
  HRESULT D3DX11CreateShaderResourceViewFromMemory(     ID3D11Device* pDevice, LPCVOID pSrcData, SIZE_T SrcDataSize, D3DX11_IMAGE_LOAD_INFO* pLoadInfo, ID3DX11ThreadPump* pPump, ID3D11ShaderResourceView** ppShaderResourceView, HRESULT* pHResult);
  HRESULT D3DX11CreateShaderResourceViewFromResource(   ID3D11Device* pDevice, HMODULE hSrcModule, LPCTSTR pSrcResource, D3DX11_IMAGE_LOAD_INFO* pLoadInfo, ID3DX11ThreadPump* pPump, ID3D11ShaderResourceView** ppShaderResourceView, HRESULT* pHResult);
  HRESULT D3DX11CreateTextureFromFile(                  ID3D11Device* pDevice, LPCTSTR pSrcFile, D3DX11_IMAGE_LOAD_INFO* pLoadInfo, ID3DX11ThreadPump* pPump, ID3D11Resource** ppTexture, HRESULT* pHResult);
  HRESULT D3DX11CreateTextureFromMemory(                ID3D11Device* pDevice, LPCVOID pSrcData, SIZE_T SrcDataSize, D3DX11_IMAGE_LOAD_INFO* pLoadInfo, ID3DX11ThreadPump* pPump, ID3D11Resource** ppTexture, HRESULT* pHResult);
  HRESULT D3DX11CreateTextureFromResource(              ID3D11Device* pDevice, HMODULE hSrcModule, LPCTSTR pSrcResource, D3DX11_IMAGE_LOAD_INFO* pLoadInfo, ID3DX11ThreadPump* pPump, ID3D11Resource** ppTexture, HRESULT* pHResult);
  HRESULT D3DX11CreateThreadPump(                       UINT cIoThreads, UINT cProcThreads, ID3DX11ThreadPump** ppThreadPump);
  HRESULT D3DX11FilterTexture(                          ID3D11DeviceContext* pContext, ID3D11Resource* pTexture, UINT SrcLevel, UINT MipFilter);
  HRESULT D3DX11GetImageInfoFromFile(                   LPCTSTR pSrcFile, ID3DX11ThreadPump* pPump, D3DX11_IMAGE_INFO* pSrcInfo, HRESULT* pHResult);
  HRESULT D3DX11GetImageInfoFromMemory(                 LPCVOID pSrcData, SIZE_T SrcDataSize, ID3DX11ThreadPump* pPump, D3DX11_IMAGE_INFO* pSrcInfo, HRESULT* pHResult);
  HRESULT D3DX11GetImageInfoFromResource(               HMODULE hSrcModule, LPCTSTR pSrcResource, ID3DX11ThreadPump* pPump, D3DX11_IMAGE_INFO* pSrcInfo, HRESULT* pHResult);
  HRESULT D3DX11LoadTextureFromTexture(                 ID3D11Resource* pSrcTexture, D3DX11_TEXTURE_LOAD_INFO* pLoadInfo, ID3D11Resource* pDstTexture);
  HRESULT D3DX11PreprocessShaderFromFile(               LPCTSTR pFileName, const D3D11_SHADER_MACRO* pDefines, LPD3D10INCLUDE pInclude, ID3DX11ThreadPump* pPump, ID3D10Blob** ppShaderText, ID3D10Blob** ppErrorMsgs, HRESULT* pHResult);
  HRESULT D3DX11PreprocessShaderFromMemory(             LPCSTR pSrcData, SIZE_T SrcDataSize, LPCSTR pFileName, const D3D11_SHADER_MACRO* pDefines, LPD3D10INCLUDE pInclude, ID3DX11ThreadPump* pPump, ID3D10Blob** ppShaderText, ID3D10Blob** ppErrorMsgs, HRESULT* pHResult);
  HRESULT D3DX11PreprocessShaderFromResource(           HMODULE hModule, LPCTSTR pResourceName, LPCTSTR pSrcFileName, const D3D11_SHADER_MACRO* pDefines, LPD3D10INCLUDE pInclude, ID3DX11ThreadPump* pPump, ID3D10Blob** ppShaderText, ID3D10Blob** ppErrorMsgs, HRESULT* pHResult);
  HRESULT D3DX11SaveTextureToFile(                      ID3D11DeviceContext* pContext, ID3D11Resource* pSrcTexture, D3DX11_IMAGE_FILE_FORMAT DestFormat, LPCTSTR pDestFile);
  HRESULT D3DX11SaveTextureToMemory(                    ID3D11DeviceContext* pContext, ID3D11Resource* pSrcTexture, D3DX11_IMAGE_FILE_FORMAT DestFormat, LPD3D10BLOB* ppDestBuf, UINT Flags);
  HRESULT D3DX11SHProjectCubeMap(                       ID3D11DeviceContext* pContext, UINT Order, ID3D11Texture2D* pCubeMap, FLOAT* pROut, FLOAT* pGOut, FLOAT* pBOut);
  HRESULT D3DX11UnsetAllDeviceObjects(                  ID3D11DeviceContext* pContext);
]]
return ffi.load( 'd3dx11_43.dll' )
