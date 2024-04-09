import numpy as np
import os, sys
import shutil

def main():
    scene_path = sys.argv[1]

    # Color files
    color_path = os.path.join(scene_path, "color")
    color_files = os.listdir(color_path)
    color_files.sort()
    for cf in color_files:
        file_num = int(cf[:-4])
        old_cf = os.path.join(color_path, cf)
        new_cf = os.path.join(color_path, "{:06d}.jpg".format(file_num))
        shutil.move(old_cf, new_cf)

    # Depth files
    depth_path = os.path.join(scene_path, "depth")
    depth_files = os.listdir(depth_path)
    depth_files.sort()
    for df in depth_files:
        file_num = int(df[:-4])
        old_df = os.path.join(depth_path, df)
        new_df = os.path.join(depth_path, "{:06d}.png".format(file_num))
        shutil.move(old_df, new_df)

    # Pose files
    pose_path = os.path.join(scene_path, "pose")
    pose_files = os.listdir(pose_path)
    pose_files.sort()
    for pf in pose_files:
        file_num = int(pf[:-4])
        old_pf = os.path.join(pose_path, pf)
        new_pf = os.path.join(pose_path, "{:06d}.txt".format(file_num))
        shutil.move(old_pf, new_pf)

if __name__ == "__main__":
    main()
