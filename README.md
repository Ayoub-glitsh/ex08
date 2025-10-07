🎓 Centre Formation - MySQL Database Project

This project contains a complete MySQL database for managing a training center (Centre de Formation).
It includes all SQL scripts to create tables, relationships, triggers, and insert test data for realistic scenarios.

Project Structure

Database name: centreformation
Main SQL file: centreformation.sql

It includes:

Table creation scripts

Data insertion scripts (sample data)

Triggers for validation and automation

Foreign key constraints with cascade rules

Database Schema

Main tables:

stagiaire: stores students' personal information

formateur: contains information about trainers

filiere: represents different training programs

module: lists the modules linked to each filiere

session: manages training sessions and their dates

inscription: tracks student registrations in sessions

evaluation: stores grades and evaluation data

HistoriqueEvaluation: keeps a history of grade changes or deletions

Triggers Implemented

check_age → prevents inserting a trainee under 18 years old

check_email_formateur_insert / update → ensures trainer emails contain '@'

verifeDate_insert / update → ensures dateFin > dateDebut in sessions

inscription_insert → automatically sets the current date as dateInscription

supprimer → deletes all evaluations when a trainee is removed

intervalle_insert / update → prevents grades outside the range [0, 20]

module_insert → prevents modules with volumeHoraire < 10

maxSession → limits session size to a maximum of 30 trainees

HistoriqueEvaluation → logs grade modifications or deletions
