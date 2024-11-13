import React from "react";
import ReactPlayer from "react-player/youtube";

const App = () => {

  const bird1 = new Audio(
    "https://upload.wikimedia.org/wikipedia/commons/9/9b/Hydroprogne_caspia_-_Caspian_Tern_XC432679.mp3"
  );

  const bird2 = new Audio(
    "https://upload.wikimedia.org/wikipedia/commons/b/b5/Hydroprogne_caspia_-_Caspian_Tern_XC432881.mp3"
  );

  function toggle1() {
    if (bird1.paused) {
      bird2.pause();
      bird1.play();
    } else {
      bird1.pause();
    }
  };

  function toggle2() {
    if (bird2.paused) {
      bird1.pause();
      bird2.play();
    } else {
      bird2.pause();
    }
  }
  return (
    <div>
      <MyVideo />
      <button onClick={toggle1}>Caspian Tern 1</button>
      <button onClick={toggle2}>Caspian Tern 2</button>
    </div>
  );
};

const MyVideo = () => {
  return (
      <ReactPlayer url='https://www.youtube.com/watch?v=jqyIw3BTFAc' volume={0.5} />   
  );
};

export default App;
