#!/bin/bash
#
#SBATCH --job-name=igibson_yolo
#SBATCH --partition=viscam
#SBATCH --time=48:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem-per-cpu=1G
#SBATCH --gres=gpu:3090:3

source $HOME/.bashrc
cd /sailhome/mjlbach/Repositories/yolov5
conda activate yolo

torchrun --nproc_per_node 3 \
  train.py --batch-size 48 \
           --img 640 \
           --data /svl/u/mjlbach/Repositories/yolov5/data/behavior_dataset.yaml \
           --weights yolov5x.pt \
           --cfg yolov5x.yaml \
           --resume
