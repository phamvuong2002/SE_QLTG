import { eren } from "../../../assets";

let accdatalist = [];

const adminid = JSON.parse(localStorage.getItem('adminid'));

const GetAccounts = () => {
  const url = `http://localhost:8080/admin/accounts/${adminid}`;
    fetch(url)
    .then((response) => response.json())
    .then(actualData => {
        // console.log(actualData.length);
        for(let i = 0; i < actualData.length; i++){
          accdatalist.push({"avt": actualData[i].AVATAR, "accid": actualData[i].ID, "name": actualData[i].NAME, "type": actualData[i].TYPE});
        }
    });
  // console.log("acc:", accdatalist);
};

GetAccounts();

export {accdatalist};

// export const accdatalist = [
//     {
//         name:'Lê Tiến',
//         type:'Author',
//         avt: eren
//     },
//     {
//         name:'Lê Tiến',
//         type:'Author',
//         avt: eren
//     },
//     {
//         name:'Lê Tiến',
//         type:'Author',
//         avt: eren
//     },
//     {
//         name:'Lê Tiến',
//         type:'Author',
//         avt: eren
//     },
//     {
//         name:'Lê Tiến',
//         type:'Author',
//         avt: eren
//     },
// ]