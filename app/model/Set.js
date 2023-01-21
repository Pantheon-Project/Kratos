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
      this.RPE = RPE;
      this.RIR = RIR || 10 - Math.ceil(RPE);
   }
}