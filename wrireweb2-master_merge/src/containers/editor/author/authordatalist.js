// import { eren } from "../../../assets";

const editorid = localStorage.getItem("editorid");
let authordatalist = []
async function connectfetch(){
    let url = "http://localhost:8080/editor/overviewAuthorList/"
    url = url + editorid 
    const response = await fetch(url);
    const data = await response.json();
    if(Object.keys(data[0]) === 'ERROR'){
        alert("ERROR: " + data[0].ERROR)
    }
    else{ 
        authordatalist = data
    }
}

connectfetch()

export { authordatalist } 
// export const authordatalist = [
//     {
//         name:'Lê Tiến',
//         avt: eren, //bỏ pen_name
//         story:3,
//         chapter:200,
//         paid_stt:'check' //đổi paid thành check
//     }, {
//         name:'Lê Tiến',
//         avt: eren,
//         story:3,
//         chapter:200,
//         paid_stt:'check'
//     }, {
//         name:'Lê Tiến',
//         avt: eren,
//         story:3,
//         chapter:200,
//         paid_stt:'check'
//     }, {
//         name:'Lê Tiến',
//         avt: eren,
//         story:3,
//         chapter:200,
//         paid_stt:'check'
//     }, {
//         name:'Lê Tiến',
//         avt: eren,
//         story:3,
//         chapter:200,
//         paid_stt:'check'
//     },
    
// ]