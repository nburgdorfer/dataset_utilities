#!/bin/bash
DATA_PATH="/media/nate/Data/ScanNet/"

#TEST_SCENES=(0709_00 0710_00)
#for S in ${TEST_SCENES[@]}
#do
#	echo -e "\n\e[1;33mWorking on scene${S}...\e[0;37m"
#	# dowload scene data
#	python download-scannet.py -o ${DATA_PATH} --id scene${S} --type .sens
#	python download-scannet.py -o ${DATA_PATH} --id scene${S} --type _vh_clean.ply
#	sleep 1.0
#
#	mv ${DATA_PATH}scans_test/scene${S} ${DATA_PATH}scene${S}
#	mv ${DATA_PATH}scene${S}/scene${S}_vh_clean.ply ${DATA_PATH}scene${S}/scene${S}.ply 
#	sleep 1.0
#
#	# extract scene data
#	python reader.py \
#		--filename ${DATA_PATH}scene${S}/scene${S}.sens \
#		--output_path ${DATA_PATH}scene${S} \
#		--export_depth_images \
#		--export_color_images \
#		--export_poses \
#		--export_intrinsics
#    sleep 1.0
#
#	# format scene data
#	python update_file_names.py ${DATA_PATH}scene${S}/
#done


TRAIN_FILE="./training.txt"
TRAIN_SCENES=$(cat "$TRAIN_FILE")
for S in ${TRAIN_SCENES[@]}
do
	echo -e "\n\e[1;33mWorking on ${S}...\e[0;37m"
	# dowload scene data
	python download-scannet.py -o ${DATA_PATH} --id ${S} --type .sens
	python download-scannet.py -o ${DATA_PATH} --id ${S} --type _vh_clean.ply
	sleep 1.0

	mv ${DATA_PATH}scans/${S} ${DATA_PATH}${S}
	mv ${DATA_PATH}${S}/${S}_vh_clean.ply ${DATA_PATH}${S}/${S}.ply 
	sleep 1.0

	# extract scene data
	python reader.py \
		--filename ${DATA_PATH}${S}/${S}.sens \
		--output_path ${DATA_PATH}${S} \
		--export_depth_images \
		--export_color_images \
		--export_poses \
		--export_intrinsics
	sleep 1.0

	# format scene data
	python update_file_names.py ${DATA_PATH}${S}/
done
