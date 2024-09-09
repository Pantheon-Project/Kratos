import ExerciseSet from "./ExerciseSet";
import { Required } from "../utils";

export class Exercise {
   /**
    * 
    * @param {string} name 
    * @param {string} description 
    */
   constructor (name, description) {
      this.name = name;
      this.description_paras = description.split('\n\n');
   }
}

export class ExerciseTemplate extends Exercise {
   /**
    * 
    * @param {string} name 
    * @param {string} description 
    * @param {ExerciseRecords} records 
    * @param {ExerciseHistory} history 
    */
   constructor(name, description, records, history) {
      super(name, description)
      this.records = records || ExerciseRecords();
      this.history = history || ExerciseHistory();
   }
}

export class ExercisePerformed extends Exercise {
   /**
    * 
    * @param {string} name 
    * @param {string} description 
    * @param {Date} date 
    * @param {string} workout_name 
    * @param {ExerciseSet[]} sets 
    */
   constructor(name, description, date, workout_name, sets) {
      super(name, description);
      this.date = date;
      this.workout_name = workout_name;
      this.sets = sets
   }
}

export class ExerciseRecords {
   constructor(ORM=0, TwRM=0, ThRM=0, FoRM=0, FiRM=0, SiRM=0, SeRM=0, ERM=0, NRM=0, TRM=0) {
      this.oneRM   = ORM;
      this.twoRM   = TwRM;
      this.threeRM = ThRM;
      this.fourRM  = FoRM;
      this.fiveRM  = FiRM;
      this.sixRM   = SiRM;
      this.sevenRM = SeRM;
      this.eightRM = ERM;
      this.nineRM  = NRM;
      this.tenRM   = TRM;
   }

   get AsDict() {
      return {
         oneRM: this.oneRM,
         twoRM: this.twoRM,
         threeRM: this.threeRM,
         fourRM: this.fourRM,
         fiveRM: this.fiveRM,
         sixRM: this.sixRM,
         sevenRM: this.sevenRM,
         eightRM: this.eightRM,
         nineRM: this.nineRM,
         tenRM: this.tenRM
      }
   }
}

export class ExerciseHistory {
   /**
    * @param {ExercisePerformed[]} performances 
    */
   constructor(performances=[]) {
      this.performances = performances || []
   }

   get Performances() { return this.performances; }
}