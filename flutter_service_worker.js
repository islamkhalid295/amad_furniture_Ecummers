'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {".git/COMMIT_EDITMSG": "b621295de1024867418ee5095b845eb5",
".git/config": "849debe5cbd81e250589f8048cb7dafa",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/HEAD": "cf7dd3ce51958c5f13fece957cc417fb",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "305eadbbcd6f6d2567e033ad12aabbc4",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/index": "f08b8fc556acc63fb57c3821eb2c79a6",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "4de57c26e00a6a568ea41140ea9ac693",
".git/logs/refs/heads/main": "4de57c26e00a6a568ea41140ea9ac693",
".git/logs/refs/remotes/origin/main": "815895b4279c757c7baedbd2171f0179",
".git/objects/03/3d29c5ee7f42ab7c9c0e93a77ae077a24152ae": "b46314b1b03c800a568a7d8971f2fd25",
".git/objects/04/e5efc15dc0c60ea2ffcc37c5bf25e96689f44d": "978222f47488835b92838c74cb5c684c",
".git/objects/0d/846c8d4e47a645a373889c8b2c499152924140": "7f8f3bbf2e35701a64b33210abfe6443",
".git/objects/0e/e3590f4d74c3a4e4621a8d048d01f13436ec7a": "25939fd9f3cb53628d90cf3f4f9a026a",
".git/objects/10/852e957846fe63ce2087f4f00613687fd8d496": "3d44e84e130fe808e696b600ef2b2e44",
".git/objects/11/2a67317ea56c33e110910a3e5111d27861b21e": "6f2facbb039aa9890cc8ba61aef62967",
".git/objects/16/68ea51e0c2de332e62536a82074e1e724eebd6": "f9fbfef02aa90676cca5f9cf65315c69",
".git/objects/18/f76345aeae6fee7dfccc5af1a1d43ec47f89e5": "2d945e48109c636bd36b3c3c2be2dcae",
".git/objects/19/38aaa0cc411f5dc13e906c9dfca419ddd401dc": "379703b752ff1c0180dfaedfa989005e",
".git/objects/1a/ce19f2f3792fcd1f0f2150ee71b0ec599574c2": "2f4376759b1a58e30eb77c95df5f3d0f",
".git/objects/1b/67c138ff82091fc33742a905804542c08abede": "2976f4c78916a85e8ba9a2547929504f",
".git/objects/1d/a0355d4b8af7f6d7395ab0c5dd8e6ce3d18de9": "cf2c19c53975cf8c3a12ffdc1b2b5561",
".git/objects/20/1afe538261bd7f9a38bed0524669398070d046": "82a4d6c731c1d8cdc48bce3ab3c11172",
".git/objects/20/cd281889b98556ae4b580776d1d79aad4bfd2d": "842a214e8725712c0b683a4ebe76a784",
".git/objects/25/f39170a03ed3d56def82f06293f793ca110c75": "01f94c9815599d680289a0acb918bdea",
".git/objects/28/c0fb4461d59b25846a386cda5c4b2f1b28ccb4": "b5afb5e508ef79067711264f456f08c9",
".git/objects/29/6feac3f14329b69d2b8db42c60bbc5adc840fc": "a4170412c91e185ac664c37d59079230",
".git/objects/2a/1bd3363f5bb12a1bc4d2b1f5f32c3de8e484b7": "e562d04fe76a59137e170d8f5300584b",
".git/objects/2b/e39c7fd3da441ddac9bea54fd12621dd39960a": "24031b20667d22ca8dba4debe8b9eab5",
".git/objects/2f/790faa2a63096d2eb8f9ba5112a8baf2179b4e": "19f09b1d674df61fad04a3780958888c",
".git/objects/30/6df10bc53c77c28b243b57f69887912a4b8abd": "8d3db73a8512c50a01faef156fd20a42",
".git/objects/34/4c0026a185bb0f2ccfeade600b7f913bc7303e": "d7e70e5214e953dec6d7b38febd97b37",
".git/objects/35/156c6c76b8c3e6ae9e4d7c74de85492dcdabfa": "81915b4f145875b9629c965a11655153",
".git/objects/3a/7795ce82e55d8f9c99e7beaa0c85141f8d2835": "8a5558c663d87709cb2353c1b35642f0",
".git/objects/3b/a6189e76378700da5a8b9b250045bcc4b82b64": "7f32b41e4ab52493695aaba5b1021271",
".git/objects/3e/6ab238373fc6c3ee7d82d6f597d39f08b25509": "b67bc8bd82c5d699bf0c0748241f7f83",
".git/objects/43/e946e398d96aee466fa0aabb625f0889c3a4bd": "ac34520dee747f675e6e0a15c0bbd2be",
".git/objects/48/33fcf9ba677d3df448c90e63368e50f8bfc8d6": "a5b926fccf641f8e2a09e52478c0d37a",
".git/objects/4b/2e5af55858355d8b10d7eba92866a5e36fbe16": "1d0f2170cd3001747d89d5fe01fc43c0",
".git/objects/4b/b3311ebe6d5524acec4aa039dae1d7a5712339": "6d044775953710b98ed9c7ba30515ac2",
".git/objects/4f/d0e51f345ee398d4c56c9a2a36514cfdc54f3e": "d8e976b7b97437231f01681fc40815a3",
".git/objects/55/9bbb4f741814691bfe598cac9eedf7a8c7bdb3": "7b75b362096b4c0ccf79821bb4e42ad4",
".git/objects/56/95aa19c774885f0e52b7589751fab6cc9ee437": "70abb59eedfa065b4e774241bddc723f",
".git/objects/60/9bf7fd66a2d6706ea3a379d972b86581e238fe": "6c6a91a73e1bafed5dd8db2f3604d25c",
".git/objects/61/7c03c122010411f33a0e18ec6b68fbfe601490": "97d5000a645b784734e72290d3784f68",
".git/objects/64/2ff98766613c6d38024751b1362c26c083a89c": "102553b4df73946ce632126f9fa8fe0e",
".git/objects/65/81c3bdc5f3cfc8db39650842801bb6e4fb2bf1": "ed3d8a56008397e04470b8b981c63910",
".git/objects/69/5695dafa7d31cc11c9ce83fbe002b36bbdebd8": "f390da910c2b435d6dcf0470d8a76486",
".git/objects/6f/e34acc5338ccadc5434b555d04922fe1af43b3": "54eafa39cd2d61f4b9efefb376dce42a",
".git/objects/72/23297430512bbec46c45bcff6219a5d546b051": "a522a9bf6ae8185bcc4ff112a1011899",
".git/objects/75/5b340ec4a74011bdda9ceb04a9016153230712": "9099906a2d20e7e27cdd18925960237e",
".git/objects/76/5ab38882ece19b2c34dcc8f7a6940ee48bda14": "5bec009e6cb862f992e43b27b84ee726",
".git/objects/78/ea317e97ec1e0e53aecfc2667b815ba0721f54": "030b6cde02a292c8809ea999a2797d2f",
".git/objects/79/ed12d348245d28611b3ebf053538159d1c9d7b": "ad8283a5d8e0dc2e072a7297403aa17e",
".git/objects/7d/3775e8692c062fb4905cd7792db88e4e077e98": "c530615ae4d8c79a642e9a1765a0108f",
".git/objects/81/7dc21384cc6935bd6edbfb1fa9672d2d0e6f37": "c50867e2c8acfc84a97581d5d87444b9",
".git/objects/82/0be895e0b07a463fd13686b746e94e2a181156": "5908896f4f3c2517018dc9d91c3aa0dd",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/94/b52e13bf7919ae4ea7235d78019b592dde8611": "b79fa5ca1cdbf72f253763797850f314",
".git/objects/98/ea888bb4032d7e5335da7473f1bf2471f489a8": "d4578b0bfeabee62b06911c61d367feb",
".git/objects/99/463bfc69d509cfd44df1b8133c781a680dc11d": "be1dc9c7993c11d4338e3181b7353d30",
".git/objects/9b/f48145f366bf1ceac4dd75dfadcea303c966e5": "bc51d9ad7eca05b1831c8298c59258c5",
".git/objects/9c/7fb60a74628f1b90da56e4fad23db2054ce3a3": "166c72ca521c9d1e893acb1c39ccd9b1",
".git/objects/9c/ffeb5839478f12ab1ba5f529cb00d7345d201a": "647971daba9a54529a30431681cdbda8",
".git/objects/ab/50fb682a17d443da90f8f1153a55f1d796e1a9": "484f3de2bace80f206cc8f9636a258a2",
".git/objects/b0/e992776143f5744c3f32c74b4642a8fef1fbb6": "25379137866b03e77b2c9e677eb6ae96",
".git/objects/b4/0f2ec0f76dfadc20ec0665dac15a3fb328b66b": "70bb1afeb877e6f28d03c1eb4ef86dbf",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/ba/8cb00dd5231f1a55de0205c16445926a696526": "be8592f9341c9b01b70890c8614c6cf7",
".git/objects/bb/3085876799532613a08c7ebe43f24f0cc46864": "1b6aa21800d948d5513c15e54d131215",
".git/objects/bd/c98ce3234510b80e7deb291854e9d158d55f67": "d52915e3e2cd937b183c4e170e4dbad9",
".git/objects/c1/2e6075f3d9dee14bce59baf5e691f44326feb9": "77fa37b6778a49611d7637442400fff0",
".git/objects/c1/7bf35f238a0d4d3511742aeb0c8904483e39cb": "0806712fc2cdd8c459854b2fb4b7a4a8",
".git/objects/c3/bab1f285eeda54ec64e69f98e245238f10134f": "257314dea653f940e33d63b418bb1828",
".git/objects/cb/840eb8c9a40699552c7a0d65a1dd3aaf01ea80": "6dc625e1a99b3e8909bc8b18d8d23f52",
".git/objects/d1/8c1b63ba6b976997d9306f9c6491df9ee24382": "6d1a74bc872522404c575fa7bb5f513c",
".git/objects/d4/985f7a4adc69afc899a8d324889e11d6f19729": "4c7278d2eb55eeedd4299a78c8cc5f8e",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/dc/2a5393546cfe9319e18b235df48ddeeffef9b2": "cc2e9f9d8daa1b33a4b36d7dcf640aaf",
".git/objects/e2/1eedf73bcb41301384e0ed1af9e3442d939f28": "18a03aff55502696bc27e527a019e25e",
".git/objects/e3/e134037aada86777b0fd0351d58edd22fc9b15": "32aa43ac5eeba8b536e04f936f0eae39",
".git/objects/e4/d63408c6516ec6b10d6a6c255b3c9b0026c108": "ca0e90398aa3e17d1e2dddf55009698c",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/ed/7e236769c0adb200b91badbbc095c1f999e193": "90f353bf750fb566ecf86984abd176fc",
".git/objects/f3/2d237d45c36bde71829a1e099dadf9815008d9": "216bb0b10e96a93ebf625e0d683682dd",
".git/objects/f4/d731dfb6f9275084c8160b4be39801b6f57548": "2e59cf864a33166cb86c1c0f223adcb4",
".git/objects/f8/e202afc8fa624a7394e13b773b734d42c9ebc6": "69190027d55d0fff2b3849dd0ff04caa",
".git/objects/f9/7a1cbe2a3d065cbfd6caf873f58e53fc724e8a": "71c3a0fab860bf3169c6f311d7481c84",
".git/objects/f9/ca5520656b45a292f98a4060da41e3962463bb": "e72772370018b229fcd55be8d777f7f1",
".git/objects/fc/d8e1fad85465bcf99d78c517f3f70fa728b9c5": "efbc8e395bec76c41a6bcee49e665d7e",
".git/refs/heads/main": "244ca9b1c1b5de65b169a16582a7cd04",
".git/refs/remotes/origin/main": "244ca9b1c1b5de65b169a16582a7cd04",
"assets/AssetManifest.bin": "6f67a9c978946dd5d6454862c9cf3efe",
"assets/AssetManifest.bin.json": "34fc17023c743f070b0734cc5011afc9",
"assets/AssetManifest.json": "5387526a302182e0a4a4bfe6bb08f8f1",
"assets/assets/fonts/Almarai/Almarai-Bold.ttf": "1c7b8f3e50a7ca693dc27d3f1314167f",
"assets/assets/fonts/Almarai/Almarai-Regular.ttf": "4fcf563640cefe40b7474aec4f966c0a",
"assets/assets/icons/eg.png": "ff318d7f0f6e39e50038c1c2f89b7a09",
"assets/assets/icons/facebook__1_-removebg-preview.jpg": "14c816b184a3d874b181c2577f161afd",
"assets/assets/icons/instagram-removebg-preview.jpg": "6072dd812f8037e6f6443aecf5b4037e",
"assets/assets/icons/Link%2520%25E2%2586%2592%2520logo.png%2520(1).png": "385ce4207e75808feb38c46c44b2cf77",
"assets/assets/icons/Link%2520%25E2%2586%2592%2520logo.png.png": "fc9fcd9ce3de0c4edf9a0ac71b01161d",
"assets/assets/icons/logo.png": "ed4ca3bd435bb842784b1d2d592bac47",
"assets/assets/icons/twitter-removebg-preview.jpg": "609f4ffd376ceeb6eedbe915f0a3590b",
"assets/assets/icons/youtube-removebg-preview.jpg": "2dce55831c1d25edc4bffb71851fb274",
"assets/assets/images/call.png": "c369a813154006733899f31bc2a9922e",
"assets/assets/images/contact_us.svg": "636fddfcb3187c6af9a5431ca6619ea8",
"assets/assets/images/home_background.jpeg": "ad467d65b6e7905c99313393bc0b5651",
"assets/assets/images/minimalist-olive-oil-bottle-glass.jpg": "6c59a7aae882c821acd56b319a0d9ffc",
"assets/assets/images/natural-cosmetics-desk.jpg": "fe8109558f01474780bb15278b9fa5af",
"assets/assets/images/sale.png": "74b3003192ba0f78a4f0d597dedd1de9",
"assets/assets/images/top-view-cosmetic-products-with-copy-space.jpg": "696a3771ddbdc788f7e1c80071c11a81",
"assets/assets/images/whatsapp_icon.png": "40716a13696bcaf32025c0d60b05d361",
"assets/FontManifest.json": "231364d5ff885d3d04782072ceeaf0a4",
"assets/fonts/MaterialIcons-Regular.otf": "50cf84ab0bee7ea280ba4f6b880d1fb5",
"assets/NOTICES": "738ecea7419e7b112a6bbbbc4354107a",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "c42d0805f90e55482d260f4e359903e6",
"assets/shaders/ink_sparkle.frag": "4096b5150bac93c41cbc9b45276bd90f",
"canvaskit/canvaskit.js": "eb8797020acdbdf96a12fb0405582c1b",
"canvaskit/canvaskit.wasm": "73584c1a3367e3eaf757647a8f5c5989",
"canvaskit/chromium/canvaskit.js": "0ae8bbcc58155679458a0f7a00f66873",
"canvaskit/chromium/canvaskit.wasm": "143af6ff368f9cd21c863bfa4274c406",
"canvaskit/skwasm.js": "87063acf45c5e1ab9565dcf06b0c18b8",
"canvaskit/skwasm.wasm": "2fc47c0a0c3c7af8542b601634fe9674",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "59a12ab9d00ae8f8096fffc417b6e84f",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "1641d11730234c7b1887fab3bbe656ef",
"/": "1641d11730234c7b1887fab3bbe656ef",
"main.dart.js": "e43be4f722661b4947a32930b7c513df",
"manifest.json": "08ba274adb94da81dbcb94f4527672c5",
"README.md": "fc88a682d0c6f5e4f62cc408b4df7ac8",
"version.json": "4256bf089035a60233e1193852b707e5"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
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
