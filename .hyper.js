"use strict";
module.exports = {
    config: {
        fontSize: 13,
        fontFamily: 'CommitMono, monospace',
        lineHeight: 1.1,
        cursorShape: 'BLOCK',
        cursorColor: '#FFFFFF',
        foregroundColor: '#A0A0A0',
        backgroundColor: '#232323',
        selectionColor: '#CACACA',
        css: `
            .header_appTitle, .header_hamburgerMenuLeft, .notifications_view {
                    display: none !important;
            }
            .terms_termsNotShifted {
                    margin-top: 0px !important;
            }
            .header_headerRounded ~ .terms_termsNotShifted {
                    margin-top: 32px !important;
            }
        `,
        padding: '4px 6px',
        colors: {
            black: '#383838',
            red: '#A95551',
            green: '#666666',
            yellow: '#A98051',
            blue: '#657D3E',
            magenta: '#767676',
            cyan: '#C9C9C9',
            white: '#BABABA',
            lightBlack: '#474747',
            lightRed: '#A97775',
            lightGreen: '#8C8C8C',
            lightYellow: '#A99175',
            lightBlue: '#98BD5E',
            lightMagenta: '#A3A3A3',
            lightCyan: '#DCDCDC',
            lightWhite: '#CACACA'
        },
        modifierKeys: { altIsMeta: true }
    },
}

