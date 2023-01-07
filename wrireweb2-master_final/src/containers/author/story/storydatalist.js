
const authorid = localStorage.getItem("authorid");
let storydatalist = []
async function connectfetch(){
    let url = "http://localhost:8080/author/storydatalist/"
    url = url + authorid 
    const response = await fetch(url);
    const data = await response.json();
    if(JSON.stringify(Object.keys(data[0])).substring(2,7) === 'ERROR'){
        alert("ERROR: " + data[0].ERROR)
        
    }
    else{ 
        for(let i = 0; i<data.length; i++){
            let url_cal ="http://localhost:8080/author/calPairUnpairStory/"
            url_cal = url_cal + data[i].storyid
            const response_cal = await fetch(url_cal);
            const data_cal = await response_cal.json();
            data[i]["unpaid"] = data_cal[0].unpaid.toFixed(2)
            data[i]["paid"] = data_cal[0].paid.toFixed(2)
        }
        storydatalist = data

    }
}
connectfetch()

export {storydatalist }
// export const storydatalist = [
//     {
//         name:'Chú bé chăn cừu',
//         avt: no_god,
//         process: 'Chapters',
//         approve: '10',
//         unpaid: '100',
//         paid: '400',
//     },
//     {
//         name:'Cừu chăn chú bé',
//         avt: no_god,
//         process: 'Chapters',
//         approve: '10',
//         unpaid: '100',
//         paid: '400',
//     },{
//         name:'Bé sói cute',
//         avt: no_god,
//         process: 'Chapters',
//         approve: '10',
//         unpaid: '100',
//         paid: '400',
//     },{
//         name:'Hết tiền cho mẹ',
//         avt: eren,
//         process: 'Draft',
//         approve: '10',
//         unpaid: '100',
//         paid: '400',
//     },{
//         name:'Hết tiền cho mẹ',
//         avt: eren,
//         process: 'Draft',
//         approve: '10',
//         unpaid: '100',
//         paid: '400',
//     },{
//         name:'Hết tiền cho mẹ',
//         avt: eren,
//         process: 'Draft',
//         approve: '10',
//         unpaid: '100',
//         paid: '400',
//     },{
//         name:'Hết tiền cho mẹ',
//         avt: eren,
//         process: 'Draft',
//         approve: '10',
//         unpaid: '100',
//         paid: '400',
//     },

// ]