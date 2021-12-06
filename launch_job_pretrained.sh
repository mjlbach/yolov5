#!/bin/bash
#
#SBATCH --job-name=igibson_yolo
#SBATCH --partition=viscam
#SBATCH --time=48:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem-per-cpu=1G
#SBATCH --gres=gpu:3090:1
#SBATCH --nodelist=viscam4

source $HOME/.bashrc
cd /sailhome/mjlbach/Repositories/yolov5
conda activate yolo

# python train.py --img 640 --batch 32 --epochs 100 --data behavior_dataset.yaml
/svl/u/mjlbach/.local/mambaforge/envs/yolo/bin/python train.py --img 640 --data behavior_dataset.yaml --weights yolov5x.pt --cfg yolov5x.yaml --resume
