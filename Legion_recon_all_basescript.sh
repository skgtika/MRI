#!/bin/bash -l

# Batch script to run a serial FreeSurfer job on Legion with the upgraded
# software stack under SGE. This version works with the modules
# environment upgraded in Oct 2015.

# FreeSurfer Version 5.3.0
# This version of FreeSurfer supports OpenMP

# 1. Force bash as the executing shell.
#$ -S /bin/bash

# 2. Request 1 hour of wallclock time (format hours:minutes:seconds).
#    Change this to suit your requirements.
#$ -l h_rt=48:00:0

# 3. Request 5G of RAM per core. Change this to suit your requirements.
#$ -l mem=8G

# 4. Set the name of the job. You can change this if you wish.
#$ -N FreeSurfer_job_1m

# 5. Select 4 threads (the most possible on the majority of Legion is 12). 
#$ -pe smp 4

# 7. Set the working directory to somewhere in your scratch space.  This is
# a necessary step with the upgraded software stack as compute nodes cannot
# write to your $HOME.
#
# NOTE: this directory must exist.
#
# Replace "<your_UCL_id>" with your UCL user ID :)
#$ -wd /home/rmjlns1/Scratch/FreeSurfer_output

# 8. Your work *must* be done in $TMPDIR 
cd $TMPDIR

# 9. Load FreeSurfer module and point to your subjects directory.
module load xorg-utils/X11R7.7
module load freesurfer/5.3.0
export SUBJECTS_DIR=~/Scratch/shared/freesurfer_subject

# 10. Run FreeSurfer programs - replace with your command(s)
#time recon-all -i $SUBJECTS_DIR/30432.n.nii -subjid 30432 -autorecon1 -cw256
time recon-all cut_1_mprage.nii.gz 
time recon-all cut_2_mprage.nii.gz 
time recon-all cut_3_mprage.nii.gz 
time recon-all cut_4_mprage.nii.gz 
time recon-all cut_5_mprage.nii.gz 
time recon-all cut_6_mprage.nii.gz 
time recon-all cut_7_mprage.nii.gz 
time recon-all cut_8_mprage.nii.gz 
time recon-all cut_9_mprage.nii.gz 
time recon-all cut_10_mprage.nii.gz 
time recon-all cut_11_mprage.nii.gz 
time recon-all cut_12_mprage.nii.gz 
time recon-all cut_13_mprage.nii.gz 
time recon-all cut_14_mprage.nii.gz 
time recon-all cut_15_mprage.nii.gz 
time recon-all cut_16_mprage.nii.gz 
time recon-all cut_17_mprage.nii.gz 
time recon-all cut_18_mprage.nii.gz 
time recon-all cut_19_mprage.nii.gz 
time recon-all cut_20_mprage.nii.gz 
time recon-all cut_21_mprage.nii.gz 
time recon-all cut_22_mprage.nii.gz 
time recon-all cut_23_mprage.nii.gz 
time recon-all cut_24_mprage.nii.gz 
time recon-all cut_25_mprage.nii.gz 
time recon-all cut_26_mprage.nii.gz 
time recon-all cut_27_mprage.nii.gz 
time recon-all cut_28_mprage.nii.gz 
time recon-all cut_29_mprage.nii.gz 
time recon-all cut_30_mprage.nii.gz 
time recon-all cut_31_mprage.nii.gz 
time recon-all cut_32_mprage.nii.gz 
time recon-all cut_33_mprage.nii.gz 
time recon-all cut_34_mprage.nii.gz 
time recon-all cut_35_mprage.nii.gz 
time recon-all cut_36_mprage.nii.gz 
time recon-all cut_37_mprage.nii.gz 
time recon-all cut_38_mprage.nii.gz 
time recon-all cut_39_mprage.nii.gz 
time recon-all cut_40_mprage.nii.gz 
time recon-all cut_41_mprage.nii.gz 
time recon-all cut_42_mprage.nii.gz 
time recon-all cut_43_mprage.nii.gz 
time recon-all cut_44_mprage.nii.gz 
time recon-all cut_45_mprage.nii.gz 
time recon-all cut_46_mprage.nii.gz 
time recon-all cut_47_mprage.nii.gz 
time recon-all cut_48_mprage.nii.gz 
time recon-all cut_49_mprage.nii.gz 
time recon-all cut_50_mprage.nii.gz 
time recon-all cut_51_mprage.nii.gz 
time recon-all cut_52_mprage.nii.gz 
time recon-all cut_53_mprage.nii.gz 
time recon-all cut_54_mprage.nii.gz 
time recon-all cut_55_mprage.nii.gz 
time recon-all cut_56_mprage.nii.gz 
time recon-all cut_57_mprage.nii.gz 
time recon-all cut_58_mprage.nii.gz 
time recon-all cut_59_mprage.nii.gz 
time recon-all cut_60_mprage.nii.gz 
time recon-all cut_61_mprage.nii.gz 
time recon-all cut_62_mprage.nii.gz 
time recon-all cut_63_mprage.nii.gz 
time recon-all cut_64_mprage.nii.gz 
time recon-all cut_65_mprage.nii.gz 
time recon-all cut_66_mprage.nii.gz 
time recon-all cut_67_mprage.nii.gz 
time recon-all cut_68_mprage.nii.gz 
time recon-all cut_69_mprage.nii.gz 
time recon-all cut_70_mprage.nii.gz 
time recon-all cut_71_mprage.nii.gz 
time recon-all cut_72_mprage.nii.gz 
time recon-all cut_73_mprage.nii.gz 
time recon-all cut_74_mprage.nii.gz 
time recon-all cut_75_mprage.nii.gz 
time recon-all cut_76_mprage.nii.gz 
time recon-all cut_77_mprage.nii.gz 
time recon-all cut_78_mprage.nii.gz 
time recon-all cut_79_mprage.nii.gz 
time recon-all cut_80_mprage.nii.gz 
time recon-all cut_81_mprage.nii.gz 
time recon-all cut_82_mprage.nii.gz 
time recon-all cut_83_mprage.nii.gz 
time recon-all cut_84_mprage.nii.gz 
time recon-all cut_85_mprage.nii.gz 
time recon-all cut_86_mprage.nii.gz 
time recon-all cut_87_mprage.nii.gz 
time recon-all cut_88_mprage.nii.gz 
time recon-all cut_89_mprage.nii.gz 
time recon-all cut_90_mprage.nii.gz 
time recon-all cut_91_mprage.nii.gz 
time recon-all cut_92_mprage.nii.gz 
time recon-all cut_93_mprage.nii.gz 
time recon-all cut_94_mprage.nii.gz 
time recon-all cut_95_mprage.nii.gz 
time recon-all cut_96_mprage.nii.gz 
time recon-all cut_97_mprage.nii.gz 
time recon-all cut_98_mprage.nii.gz 
time recon-all cut_99_mprage.nii.gz 
time recon-all cut_100_mprage.nii.gz 
time recon-all cut_101_mprage.nii.gz 
time recon-all cut_102_mprage.nii.gz 
time recon-all cut_103_mprage.nii.gz 
time recon-all cut_104_mprage.nii.gz 
time recon-all cut_105_mprage.nii.gz 
time recon-all cut_106_mprage.nii.gz 
time recon-all cut_107_mprage.nii.gz 
time recon-all cut_108_mprage.nii.gz 
time recon-all cut_109_mprage.nii.gz 
time recon-all cut_110_mprage.nii.gz 
time recon-all cut_111_mprage.nii.gz 
time recon-all cut_112_mprage.nii.gz 
time recon-all cut_113_mprage.nii.gz 
time recon-all cut_114_mprage.nii.gz 
time recon-all cut_115_mprage.nii.gz 
time recon-all cut_116_mprage.nii.gz 
time recon-all cut_117_mprage.nii.gz 
time recon-all cut_118_mprage.nii.gz 
time recon-all cut_119_mprage.nii.gz 
time recon-all cut_120_mprage.nii.gz 
time recon-all cut_121_mprage.nii.gz 
time recon-all cut_122_mprage.nii.gz 
time recon-all cut_123_mprage.nii.gz 
time recon-all cut_124_mprage.nii.gz 
time recon-all cut_125_mprage.nii.gz 
time recon-all cut_126_mprage.nii.gz 
time recon-all cut_127_mprage.nii.gz 
time recon-all cut_128_mprage.nii.gz 
time recon-all cut_129_mprage.nii.gz 
time recon-all cut_130_mprage.nii.gz 
time recon-all cut_131_mprage.nii.gz 
time recon-all cut_132_mprage.nii.gz 
time recon-all cut_133_mprage.nii.gz 
time recon-all cut_134_mprage.nii.gz 
time recon-all cut_135_mprage.nii.gz 
time recon-all cut_136_mprage.nii.gz 
time recon-all cut_137_mprage.nii.gz 
time recon-all cut_138_mprage.nii.gz 
time recon-all cut_139_mprage.nii.gz 
time recon-all cut_140_mprage.nii.gz 
time recon-all cut_141_mprage.nii.gz 
time recon-all cut_142_mprage.nii.gz 
time recon-all cut_143_mprage.nii.gz 
time recon-all cut_144_mprage.nii.gz 
time recon-all cut_145_mprage.nii.gz 
time recon-all cut_146_mprage.nii.gz 
time recon-all cut_147_mprage.nii.gz 
time recon-all cut_148_mprage.nii.gz 
time recon-all cut_149_mprage.nii.gz 
time recon-all cut_150_mprage.nii.gz 
time recon-all cut_151_mprage.nii.gz 
time recon-all cut_152_mprage.nii.gz 
time recon-all cut_153_mprage.nii.gz 
time recon-all cut_154_mprage.nii.gz 
time recon-all cut_155_mprage.nii.gz 
time recon-all cut_156_mprage.nii.gz 
time recon-all cut_157_mprage.nii.gz 
time recon-all cut_158_mprage.nii.gz 
time recon-all cut_159_mprage.nii.gz 
time recon-all cut_160_mprage.nii.gz 
time recon-all cut_161_mprage.nii.gz 
time recon-all cut_162_mprage.nii.gz 
time recon-all cut_163_mprage.nii.gz 
time recon-all cut_164_mprage.nii.gz 
time recon-all cut_165_mprage.nii.gz 
time recon-all cut_166_mprage.nii.gz 
time recon-all cut_167_mprage.nii.gz 
time recon-all cut_168_mprage.nii.gz 
time recon-all cut_169_mprage.nii.gz 
time recon-all cut_170_mprage.nii.gz 
time recon-all cut_171_mprage.nii.gz 
time recon-all cut_172_mprage.nii.gz 
time recon-all cut_173_mprage.nii.gz 
time recon-all cut_174_mprage.nii.gz 
time recon-all cut_175_mprage.nii.gz 
time recon-all cut_176_mprage.nii.gz 
time recon-all cut_177_mprage.nii.gz 
time recon-all cut_178_mprage.nii.gz 
time recon-all cut_179_mprage.nii.gz 
time recon-all cut_180_mprage.nii.gz 
time recon-all cut_181_mprage.nii.gz 
time recon-all cut_182_mprage.nii.gz 
time recon-all cut_183_mprage.nii.gz 
time recon-all cut_184_mprage.nii.gz 
time recon-all cut_185_mprage.nii.gz 
time recon-all cut_186_mprage.nii.gz 
time recon-all cut_187_mprage.nii.gz 
time recon-all cut_188_mprage.nii.gz 
time recon-all cut_189_mprage.nii.gz 
time recon-all cut_190_mprage.nii.gz 
time recon-all cut_191_mprage.nii.gz 
time recon-all cut_192_mprage.nii.gz 
time recon-all cut_193_mprage.nii.gz 
time recon-all cut_194_mprage.nii.gz 
time recon-all cut_195_mprage.nii.gz 
time recon-all cut_196_mprage.nii.gz 
time recon-all cut_197_mprage.nii.gz 
time recon-all cut_198_mprage.nii.gz 
time recon-all cut_199_mprage.nii.gz 
time recon-all cut_200_mprage.nii.gz 
time recon-all cut_201_mprage.nii.gz 
time recon-all cut_202_mprage.nii.gz 
time recon-all cut_203_mprage.nii.gz 
time recon-all cut_204_mprage.nii.gz 
time recon-all cut_205_mprage.nii.gz 
time recon-all cut_206_mprage.nii.gz 
time recon-all cut_207_mprage.nii.gz 
time recon-all cut_208_mprage.nii.gz 
time recon-all cut_209_mprage.nii.gz 
time recon-all cut_210_mprage.nii.gz 
time recon-all cut_211_mprage.nii.gz 
time recon-all cut_212_mprage.nii.gz 
time recon-all cut_213_mprage.nii.gz 
time recon-all cut_214_mprage.nii.gz 
time recon-all cut_215_mprage.nii.gz 
time recon-all cut_216_mprage.nii.gz 
time recon-all cut_217_mprage.nii.gz 
time recon-all cut_218_mprage.nii.gz 
time recon-all cut_219_mprage.nii.gz 
time recon-all cut_220_mprage.nii.gz 
time recon-all cut_221_mprage.nii.gz 
time recon-all cut_222_mprage.nii.gz 
time recon-all cut_223_mprage.nii.gz 
time recon-all cut_224_mprage.nii.gz 
time recon-all cut_225_mprage.nii.gz 
time recon-all cut_226_mprage.nii.gz 
time recon-all cut_227_mprage.nii.gz 
time recon-all cut_228_mprage.nii.gz 
time recon-all cut_229_mprage.nii.gz 
time recon-all cut_230_mprage.nii.gz 
time recon-all cut_231_mprage.nii.gz 
time recon-all cut_232_mprage.nii.gz 
time recon-all cut_233_mprage.nii.gz 
time recon-all cut_234_mprage.nii.gz 
time recon-all cut_235_mprage.nii.gz 
time recon-all cut_236_mprage.nii.gz 
time recon-all cut_237_mprage.nii.gz 
time recon-all cut_238_mprage.nii.gz 
time recon-all cut_239_mprage.nii.gz 
time recon-all cut_240_mprage.nii.gz 
time recon-all cut_241_mprage.nii.gz 
time recon-all cut_242_mprage.nii.gz 
time recon-all cut_243_mprage.nii.gz 
time recon-all cut_244_mprage.nii.gz 
time recon-all cut_245_mprage.nii.gz 
time recon-all cut_246_mprage.nii.gz 
time recon-all cut_247_mprage.nii.gz 
time recon-all cut_248_mprage.nii.gz 
time recon-all cut_249_mprage.nii.gz 
time recon-all cut_250_mprage.nii.gz 

