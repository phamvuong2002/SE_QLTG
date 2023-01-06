import React from 'react'
import OverviewAuthor from './overviewAuthor'

const OverviewAuthorList = ({authorData}) => {
  return (
    <div className='py-1'>
         {authorData.map((data) => (
        <OverviewAuthor 
        authorid={data.authorid}
        avt={data.avt} 
        name={data.name} 
        penname={data.penname}
        story={data.story}
        chapter={data.chapter}
        // paid_stt={data.paid_stt}
        />
      ))}
    </div>
  )
}

export default OverviewAuthorList