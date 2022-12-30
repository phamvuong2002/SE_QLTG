import React from 'react'
import OverviewAcc from './overviewAcc'

const OverviewAccList = ({accData}) => {
  return (
    <div className='py-1'>
         {accData.map((data) => (
        <OverviewAcc key={data.id} avt={data.avt} name={data.name} type={data.type}/>
      ))}
    </div>
  )
}

export default OverviewAccList