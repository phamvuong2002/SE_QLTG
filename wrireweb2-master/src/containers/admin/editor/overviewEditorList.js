import React from 'react';
import OverviewEditor from './overviewEditor';

const OverviewEditorList = ({authorData}) => {
  return (
    <div className='py-1'>
         {authorData.map((data) => (
        <OverviewEditor 
        editorid={data.editorid} 
        avt={data.avt} 
        name={data.name} 
        penname={data.penname}
        author={data.author}
        story={data.story}/>
      ))}
    </div>
  )
}

export default OverviewEditorList