let editordatalist = [];
const adminid = JSON.parse(localStorage.getItem('adminid'));

const GetEditors = () => {
  const url = `http://localhost:8080/admin/editors/${adminid}`;
    fetch(url)
    .then((response) => response.json())
    .then(actualData => {
        // console.log(actualData.length);
        for(let i = 0; i < actualData.length; i++){
          editordatalist.push({"avt": actualData[i].AVATAR, "editorid": actualData[i].EDITORID, "name": actualData[i].EDITORNAME, "penname": actualData[i].PENNAME, "author": actualData[i].SLTG, "story": actualData[i].SLT});
        }
    });
  // console.log("editor:", editordatalist);
};

GetEditors();

export {editordatalist};


// export const editordatalist = [
//     {
//         name:'Lê Tiến',
//         pen_name:'1 author',
//         avt: eren,
//         story:3,
//         chapter:200,
//     }, {
//         name:'Lê Tiến',
//         pen_name:'1 author',
//         avt: eren,
//         story:3,
//         chapter:200,
//     }, {
//         name:'Lê Tiến',
//         pen_name:'1 author',
//         avt: eren,
//         story:3,
//         chapter:200,
//     }, {
//         name:'Lê Tiến',
//         pen_name:'1 author',
//         avt: eren,
//         story:3,
//         chapter:200,
//     }, {
//         name:'Lê Tiến',
//         pen_name:'1 author',
//         avt: eren,
//         story:3,
//         chapter:200,
//     },
    
// ]