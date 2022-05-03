require('which-key').register({
    h = {
        name = 'Horse',
        ['s'] = {
            function ()
                require('duck').hatch('🐎')
            end,
            'Start the horse!'
        },
        ['k']= {
            require('duck').cook,
            'Kill the horse!'
        }

    }
}, { prefix = '<Leader>' })
