import React from 'react'
import OverviewEditor from './overviewEditor'

const OverviewEditorList = ({authorData}) => {
  return (
    <div className='py-1'>
         {authorData.map((data) => (
        <OverviewEditor 
        key={data.id} 
        avt={data.avt} 
        name={data.name} 
        pen_name={data.pen_name}
        story={data.story}
        chapter={data.chapter}/>
      ))}
    </div>
  )
}

export default OverviewEditorList