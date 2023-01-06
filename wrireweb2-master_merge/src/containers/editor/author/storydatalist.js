const authorid = localStorage.getItem("editor_authorid");

let storydatalist = []
async function connectfetch(){
    let url = "http://localhost:8080/editor/storydatalist/authortab/"
    url = url + authorid 
    const response = await fetch(url);
    const data = await response.json();
    
    if(Object.keys(data[0]) === 'ERROR'){
        alert("ERROR: " + data[0].ERROR)
    }
    else{ 
        for(let i = 0; i<data.length; i++){
            let url_cal ="http://localhost:8080/editor/calPairUnpairStory/"
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

export { storydatalist }
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
//         name:'Chú bé chăn cừu',
//         avt: no_god,
//         process: 'Chapters',
//         approve: '10',
//         unpaid: '100',
//         paid: '400',
//     },{
//         name:'Chú bé chăn cừu',
//         avt: no_god,
//         process: 'Chapters',
//         approve: '10',
//         unpaid: '100',
//         paid: '400',
//     },{
//         name:'Chú bé chăn cừu',
//         avt: no_god,
//         process: 'Chapters',
//         approve: '10',
//         unpaid: '100',
//         paid: '400',
//     },{
//         name:'Chú bé chăn cừu',
//         avt: no_god,
//         process: 'Chapters',
//         approve: '10',
//         unpaid: '100',
//         paid: '400',
//     }

// ]