'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"main.dart.wasm": "2941731ab9de771270e28b3fc22b4814",
"icons/Icon-maskable-192.png": "979dcc8e0aaea883729ea7a73aced2ec",
"icons/Icon-192.png": "979dcc8e0aaea883729ea7a73aced2ec",
"icons/Icon-maskable-512.png": "41368912640aaca1614160d55799e8da",
"icons/Icon-512.png": "41368912640aaca1614160d55799e8da",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/AssetManifest.bin.json": "a1a9ccd0f57653d9a886213dada627d2",
"assets/AssetManifest.bin": "d9ff49dc97a09cc6411cebc58559e816",
"assets/AssetManifest.json": "dae651464c00b41900d28de3d427b6a4",
"assets/assets/ThirdParty/fdroid-logo.svg": "bb5a48ffcbd63e20a8b66bc3c8bc1e53",
"assets/assets/ThirdParty/fdroid-logo.png": "bae4af7ab63ec7043570db1d7ee0c953",
"assets/assets/KitX-Icon-192x-margin-2x.png": "95d78270bf75c6f8325fe444f2f79059",
"assets/packages/community_material_icon/fonts/materialdesignicons-webfont.ttf": "174c02fc4609e8fc4389f5d21f16a296",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/FontManifest.json": "3f768ae705296be001f7819d2895cc30",
"assets/NOTICES": "fe7a243a106a6bf4bfc9b24ab2801f80",
"main.dart.js": "8c5e682313d492bf6fd52337c8dd67d0",
"styles/loaders.min.css": "7775ba8f85f6e2f599eb0d1e128c0782",
"styles/style.min.css": "581d4aeea8e13828f8ee673bff1c51e5",
"styles/style.css": "0009142845237534051e5740bee599e4",
"styles/loaders.css": "be245fc49782d55364922414a82798b3",
"manifest.json": "a5f1e303b743f5845d0d9991d24832cb",
"version.json": "db868499f0b987b431137c14881b5797",
"canvaskit/skwasm.js.symbols": "e72c79950c8a8483d826a7f0560573a1",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/skwasm.wasm": "39dd80367a4e71582d234948adc521c0",
"canvaskit/canvaskit.wasm": "7a3f4ae7d65fc1de6a6e7ddd3224bc93",
"canvaskit/canvaskit.js.symbols": "bdcd3835edf8586b6d6edfce8749fb77",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.wasm": "f504de372e31c8031018a9ec0a9ef5f0",
"canvaskit/chromium/canvaskit.js.symbols": "b61b5f4673c9698029fa0a746a9ad581",
"scripts/console.js": "a91a743912cfc2ea9bdb19e933e4aeda",
"scripts/console.min.js": "5e429975edf2251641b7525ddc397a66",
"scripts/wasm/utils.js": "04ffba06177554015f448a6db239e484",
"scripts/wasm/utils-min.js": "5751e213e98ff12522c4313f034b8315",
"scripts/script.min.js": "425f58bf4096d634503bf5a1797207d8",
"scripts/script.js": "6948e9473dbdb8069c60e2dde6071894",
"flutter_bootstrap.js": "c2bb9e4e84a12849b2f1429fd7987efd",
"main.dart.mjs": "c6be0995dc7d90df836a39b14944fd3c",
"favicon.png": "4fa8738dbf5fa0e3e926bc50f4a5921c",
"index.html": "db8e18aab9cc3b4d735df68324b7c0bf",
"/": "db8e18aab9cc3b4d735df68324b7c0bf",
"sub/wasmerr/saderr.svg": "ffc1ba458edadbb1fe0f4e1d11f4eb27",
"sub/wasmerr/styles/normalize-min.css": "94cc5196ca57b37c54aa017b67d18f7c",
"sub/wasmerr/styles/style.css": "833f7fb555411fca0af3765ec9570a83",
"sub/wasmerr/styles/style-min.css": "6499e0dcde97c2e1c349f90404c62022",
"sub/wasmerr/styles/normalize.css": "c657d92d0cee44796c4cf66c1872737b",
"sub/wasmerr/index.html": "2cb2ad0c52ad7d2ffb7453dc2a42be85",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"main.dart.wasm",
"main.dart.mjs",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
