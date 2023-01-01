// import { eren } from "../../../assets";

let authordatalist = [];
const adminid = JSON.parse(localStorage.getItem('adminid'));

const GetAuthors = () => {
  const url = `http://localhost:8080/admin/authors/${adminid}`;
    fetch(url)
    .then((response) => response.json())
    .then(actualData => {
        // console.log(actualData.length);
        for(let i = 0; i < actualData.length; i++){
          authordatalist.push({"avt": actualData[i].AVATAR, "authorid": actualData[i].AUTHORID, "name": actualData[i].AUTHORNAME, "penname": actualData[i].PENNAME, "chapter": actualData[i].SLC, "story": actualData[i].SLT});
        }
    });
  console.log("editor:", authordatalist);
};

GetAuthors();

export {authordatalist};

// export const authordatalist = [
//     {
//         name:'Lê Tiến',
//         pen_name:'Alex',
//         avt: eren,
//         story:3,
//         chapter:200,
//         paid_stt:'paid'
//     }, {
//         name:'Lê Tiến',
//         pen_name:'Alex',
//         avt: eren,
//         story:3,
//         chapter:200,
//         paid_stt:'paid'
//     }, {
//         name:'Lê Tiến',
//         pen_name:'Alex',
//         avt: eren,
//         story:3,
//         chapter:200,
//         paid_stt:'paid'
//     }, {
//         name:'Lê Tiến',
//         pen_name:'Alex',
//         avt: eren,
//         story:3,
//         chapter:200,
//         paid_stt:'paid'
//     }, {
//         name:'Lê Tiến',
//         pen_name:'Alex',
//         avt: eren,
//         story:3,
//         chapter:200,
//         paid_stt:'paid'
//     },
    
// ]