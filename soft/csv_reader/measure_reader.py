import pandas as pd
import matplotlib.pyplot as plt

headerName = ["flag", "dt", "press", "gravity_x", "gravity_y", "gravity_z", "gyro_x", "gyro_y", "gyro_z", "mag_x", "mag_y", "mag_z", "accel_x", "accel_y", "accel_z", "euler_h", "euler_p", "euler_r", "quater_w", "quater_x", "quater_y", "quater_z"] 

df = pd.read_csv('MESURES.csv', sep=';', index_col=False, names=headerName, lineterminator='\n')

df.head()
df.to_excel(r'./Mesures.xlsx', index = False, header=True)


fig, ((flag, press), (grav, gyro), (mag, acc), (euler, quater)) = plt.subplots(4, 2)
fig.suptitle('Mesures IMU')

flag.grid()
flag.plot(df['flag'])
flag.set_ylabel(r'Flag mesure')


press.grid()
press.plot(df['press'])
press.set_ylabel(r'Pression $[bar]$')

grav.grid()
grav.plot(df['gravity_x'], label="X")
grav.plot(df['gravity_y'], label="Y")
grav.plot(df['gravity_z'], label="Z")
grav.legend(loc=1, prop={'size': 7})
grav.set_ylabel(r'Gravity $[m/s^2]$')

gyro.grid()
gyro.plot(df['gyro_x'], label="X")
gyro.plot(df['gyro_y'], label="Y")
gyro.plot(df['gyro_z'], label="Z")
gyro.legend(loc=1, prop={'size': 7})
gyro.set_ylabel('Gyroscope $[°/s]$')

mag.grid()
mag.plot(df['mag_x'], label="X")
mag.plot(df['mag_y'], label="Y")
mag.plot(df['mag_z'], label="Z")
mag.legend(loc=1, prop={'size': 7})
mag.set_ylabel('Magnitude $[uT]$')

acc.grid()
acc.plot(df['accel_x'], label="X")
acc.plot(df['accel_y'], label="Y")
acc.plot(df['accel_z'], label="Z")
acc.legend(loc=1, prop={'size': 7})
acc.set_ylabel('Accel. $[m/s]$')

euler.grid()
euler.plot(df['euler_h'], label="H")
euler.plot(df['euler_p'], label="P")
euler.plot(df['euler_r'], label="R")
euler.legend(loc=1, prop={'size': 7})
euler.set_ylabel('Euler')

quater.grid()
quater.plot(df['quater_w'], label="W")
quater.plot(df['quater_x'], label="X")
quater.plot(df['quater_y'], label="Y")
quater.plot(df['quater_z'], label="Z")
quater.legend(loc=1, prop={'size': 7})
quater.set_ylabel('Quaternion')


manager = plt.get_current_fig_manager()
manager.full_screen_toggle()
plt.show()



