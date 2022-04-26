require('which-key').register({
    d = {
        name = 'Duck',
        ['d'] = {
            require("duck").hatch,
            'Start the duck!'
        },
        ['k']= {
            require("duck").cook,
            'Kill the duck'
        }

    }
}, { prefix = '<Leader>' })
