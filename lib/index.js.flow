/* @flow */


exports.handler = function (event: any, context: any, callback: any) {

    const match: FoosballMatch = event;
    callback(null, match);
};



export type FoosballMatch = {
    match_id: string;
    timestamp: Date;
    team1: Array<string>;
    team2: Array<string>;
    score1: Number;
    score2: Number;
}
