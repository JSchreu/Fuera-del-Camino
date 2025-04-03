const CACHE_NAME = 'wijn-proefmethode-v1';
const urlsToCache = [
    './',
    './index.html',
    './style.css',
    './script.js',
    './manifest.json',
    './fonts/fontawesome.css',
    './fonts/fa-solid-900.woff2',
    './fonts/fa-solid-900.woff',
    './fonts/fa-solid-900.ttf',
    './fonts/fa-solid-900.eot',
    './fonts/fa-solid-900.svg',
    './icons/icon-192x192.png',
    './icons/icon-512x512.png'
];

// Installeer service worker en cache de benodigde bestanden
self.addEventListener('install', event => {
    event.waitUntil(
        caches.open(CACHE_NAME)
            .then(cache => {
                console.log('Opened cache');
                return cache.addAll(urlsToCache);
            })
    );
});

// Activeer service worker en verwijder oude caches
self.addEventListener('activate', event => {
    event.waitUntil(
        caches.keys().then(cacheNames => {
            return Promise.all(
                cacheNames.map(cacheName => {
                    if (cacheName !== CACHE_NAME) {
                        return caches.delete(cacheName);
                    }
                })
            );
        })
    );
});

// Intercepteer netwerk requests
self.addEventListener('fetch', event => {
    event.respondWith(
        caches.match(event.request)
            .then(response => {
                // Cache hit - return response
                if (response) {
                    return response;
                }

                // Clone de request omdat deze maar één keer gebruikt kan worden
                const fetchRequest = event.request.clone();

                return fetch(fetchRequest).then(response => {
                    // Check of we een geldige response hebben ontvangen
                    if (!response || response.status !== 200 || response.type !== 'basic') {
                        return response;
                    }

                    // Clone de response omdat deze ook maar één keer gebruikt kan worden
                    const responseToCache = response.clone();

                    caches.open(CACHE_NAME)
                        .then(cache => {
                            cache.put(event.request, responseToCache);
                        });

                    return response;
                }).catch(() => {
                    // Als de fetch mislukt, return de offline pagina
                    if (event.request.mode === 'navigate') {
                        return caches.match('./index.html');
                    }
                });
            })
    );
}); 