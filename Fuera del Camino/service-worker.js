const CACHE_NAME = 'wijn-proefmethode-v1';
const BASE_PATH = '/Fuera-del-Camino';

const urlsToCache = [
    BASE_PATH + '/',
    BASE_PATH + '/index.html',
    BASE_PATH + '/style.css',
    BASE_PATH + '/script.js',
    BASE_PATH + '/manifest.json',
    BASE_PATH + '/fonts/fontawesome.css',
    BASE_PATH + '/fonts/fa-solid-900.woff2',
    BASE_PATH + '/fonts/fa-solid-900.woff',
    BASE_PATH + '/fonts/fa-solid-900.ttf',
    BASE_PATH + '/fonts/fa-solid-900.eot',
    BASE_PATH + '/fonts/fa-solid-900.svg',
    BASE_PATH + '/icons/icon-192x192.png',
    BASE_PATH + '/icons/icon-512x512.png'
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
                        return caches.match(BASE_PATH + '/index.html');
                    }
                });
            })
    );
}); 