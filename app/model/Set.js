export default class ExerciseSet {
   /**
    * 
    * @param {number} reps 
    * @param {number} weight 
    * @param {number} RPE 
    * @param {number?} RIR 
    */
   constructor(reps, weight, RPE, RIR=null) {
      this.reps = reps
      this.weight = weight;
      this.rpe = RPE;
      this.rir = RIR != null ? RIR : 10 - Math.ceil(RPE);
   }

   static FromDict(set_dict) {
      reps = parseInt(set_dict.reps)
      this.reps = reps != NaN ? reps : 0
      weight = parseInt(set_dict.weight)
      this.weight = weight != NaN ? weight : 0
      rpe = parseInt(set_dict.rpe)
      this.rpe = rpe != NaN ? rpe : 0
      rir = parseInt(set_dict.rir)
      this.rir = rir != NaN ? rir : 0
   }

   get Repetitions() { return this.reps; }
   get Weight()      { return this.weight; }
   get RPE()         { return this.rpe; }
   get RIR()         { return this.rir; }
}