module.exports = {
    apps: [
        {
            name: 'Data',
            script: '/opt/sigasac/data/dist/main.js',
            instances: 1,
            autorestart: true,
            watch: true,
            max_memory_restart: '1G'
        },
        {
            name: 'Main',
            script: '/opt/sigasac/main/dist/main.js',
            instances: 1,
            autorestart: true,
            watch: true,
            max_memory_restart: '1G'
        },
        {
            name: 'Config',
            script: '/opt/sigasac/configurations/dist/main.js',
            instances: 1,
            autorestart: true,
            watch: true,
            max_memory_restart: '1G'
        },
        {
            name: 'User',
            script: '/opt/sigasac/users/dist/main.js',
            instances: 1,
            autorestart: true,
            watch: true,
            max_memory_restart: '1G'
        }
    ]
};
