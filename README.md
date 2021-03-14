# Captcha-solver
This project solves text based captchas

# Segmentation module
The captcha is converted to grayscale and fed into the segmentation algorithm that is implemented in OCTAVE. (Open source alternative to MATLAB)

Range of splits that contain characters are obtained.
![2](https://user-images.githubusercontent.com/41861674/111073662-910fe200-8505-11eb-91bf-f5a8402f8488.png)

Once range is obtained, signal processing is utilized to obtain appropriate splits
![3](https://user-images.githubusercontent.com/41861674/111073664-910fe200-8505-11eb-8655-6fc9b63c27a4.png)

Missing splits are inserted
![5](https://user-images.githubusercontent.com/41861674/111073671-940ad280-8505-11eb-8f08-e501b1f325ac.png)

final visualization for character segmentation algorithm.
![result](https://user-images.githubusercontent.com/41861674/111073672-94a36900-8505-11eb-91de-959a10af5c80.png)

LENET-5 architecture for character prediction
![model](https://user-images.githubusercontent.com/41861674/111073696-a422b200-8505-11eb-9262-9df8a38258a3.png)

Complete project example
![prediction](https://user-images.githubusercontent.com/41861674/111073722-bd2b6300-8505-11eb-84d1-279fba60121a.PNG)
