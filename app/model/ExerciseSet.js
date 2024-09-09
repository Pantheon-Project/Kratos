import { Required } from "../utils";

export default class ExerciseSet {
   /**
    * 
    * @param {number} reps 
    * @param {number} weight 
    * @param {number} RPE 
    * @param {number?} RIR 
    */
   constructor(reps=Required("reps"), weight=Required("weight"), RPE=Required("RPE"), RIR=null) {
      this.reps = reps
      this.weight = weight;
      this.rpe = RPE;
      this.rir = RIR != null ? RIR : 10 - Math.ceil(RPE);
   }

   static FromDict(set_dict) {
      // Do basic parse from the dict
      reps   = parseInt(set_dict.reps);
      weight = parseInt(set_dict.weight);
      rpe    = parseInt(set_dict.rpe);
      rir    = parseInt(set_dict.rir);
      // If we got any nans, default to 0.
      reps   = reps   != NaN ? reps : 0;
      weight = weight != NaN ? weight : 0;
      rpe    = rpe    != NaN ? rpe : 0;
      rir    = rir    != NaN ? rir : 0;
      return ExerciseSet(reps, weight, RPE, RIR);
   }

   static FromJSON(set_json) {
      try {
         set_dict = JSON.parse(set_json);
         return this.FromDict(set_dict);
      }
      catch (err) {
         console.error(`Got error parsing JSON dict ${set_json}\nError Message: ${err.message}`);
         return ExerciseSet(0,0,0,0);
      }
   }

   get Repetitions() { return this.reps; }
   get Weight()      { return this.weight; }
   get RPE()         { return this.rpe; }
   get RIR()         { return this.rir; }
}