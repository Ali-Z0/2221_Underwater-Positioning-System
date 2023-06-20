import pandas as pd


headerName = ["flag", "dt", "press", "gravity_x", "gravity_y", "gravity_z", "gyro_x", "gyro_y", "gyro_z", "mag_x", "mag_y", "mag_z", "accel_x", "accel_y", "accel_z", "euler_h", "euler_p", "euler_r", "quater_w", "quater_x", "quater_y", "quater_z"] 

df = pd.read_csv('MESURES.csv', sep=';', index_col=False, names=headerName, lineterminator='\n')

df.head()

print(df.to_string(index=False))

df.to_excel(r'./Mesures.xlsx', index = False, header=True)





