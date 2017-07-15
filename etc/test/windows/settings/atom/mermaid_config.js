// // config mermaid init call
// // http://knsv.github.io/mermaid/#configuration
// //
// // You can edit the 'MERMAID_CONFIG' variable below.
// MERMAID_CONFIG = {
//   startOnLoad: false
// }

// 以下からガントの週番号 W.** -> yyyy/mm/dd に変更
// [http://qiita.com/cha2maru/items/9ba4413bd91083e7c984] より

MERMAID_CONFIG = {
  startOnLoad: false,
    gantt: {
        fontSize: 12,
        axisFormatter: [
            // Within a day
            ["X%I:%M", function(d) {
                return d.getHours();
            }],
            // Monday a week
            ["%Y/%m/%d", function(d) {
                return d.getDay() == 1;
            }],
            // Day within a week (not monday)
            ["%m/%d", function(d) {
                return d.getDay() && d.getDate() != 1;
            }],
            // within a month
            ["%m/%d", function(d) {
                return d.getDate() != 1;
            }],
            // Month
            ["%y-%m", function(d) {
                return d.getMonth();
            }]
        ]
    }
}
