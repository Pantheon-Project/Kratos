<svelte:options namespace="html"/>
<script lang="ts">
   import { Template } from "svelte-native/components";
   
   let message        : string   = "Kratos: Powerlifting Training";
   let programs       : object[] = [];
   let dones          : object[] = [] //completed items go here
   let textFieldValue : string   = "";

   const removeFromList = (list:object[], item:object) => list.filter(t => t !== item);
   const addToList      = (list:object[], item:object) => [item, ...list] 
   
   function onButtonTap() {
      if (textFieldValue === "") return; // Prevents users from entering an empty string.
      console.log("New program added: " + textFieldValue + "."); // Logs the newly added task in the console for debugging.
      programs = [{ name: textFieldValue }, ...programs]; // Adds tasks in the ToDo array. Newly added tasks are immediately shown on the screen.
      textFieldValue = ""; // Clears the text field so that users can start adding new tasks immediately.
   }

   async function onItemTap(args:object) {
		let result = await action("What do you want to do with this task?", "Cancel", [
				"Mark completed",
				"Delete forever"
		]);
      console.log(result); // Logs the selected option for debugging.
		let item = programs[args.index]
		switch (result) {
				case "Mark completed":
						dones = addToList(dones, item) // Places the tapped active task at the top of the completed tasks.
						programs = removeFromList(programs, item) // Removes the tapped active task.
						break;
				case "Delete forever":
						programs = removeFromList(programs, item) // Removes the tapped active task.
						break;
				case "Cancel" || undefined: // Dismisses the dialog
						break;
		}
	}

   async function onDoneTap(args) {
      let result = await action("What do you want to do with this task?", "Cancel", [
            "Mark To Do",
            "Delete forever"
      ]);

      console.log(result); // Logs the selected option for debugging.
      let item = dones[args.index]
      switch (result) {
            case "Mark To Do":
                  programs = addToList(programs, item) // Places the tapped active task at the top of the completed tasks.
                  dones = removeFromList(dones, item) // Removes the tapped active task.
                  break;
            case "Delete forever":
                  dones = removeFromList(dones, item) // Removes the tapped active task.
                  break;
            case "Cancel" || undefined: // Dismisses the dialog
                  break;
      }
   }
   
</script>

<page>
   <actionBar title="Kratos" />
   <tabView>
      <tabViewItem title="Home">
         <gridLayout>
            <label class="info">
               <formattedString>
                  <span class="fas" text="&#xf135;" />
                  <span text=" {message}" />
               </formattedString>
            </label>
         </gridLayout>
      </tabViewItem>
      <tabViewItem title="Programs">
         <gridLayout columns="*,120" rows="20,70,*">
            <label colSpan="2" row="0" textWrap="true">This tab will list programs you've defined.</label>
            <!-- Configures the text field and ensures that pressing Return on the keyboard
               produces the same result as tapping the button. -->
            <textField
               col="0"
               row="1"
               bind:text={textFieldValue}
               hint="Type new program name..."
               editable="true"
               on:returnPress={onButtonTap}
            />
            <button col="1" row="1" class="-primary" text="Add program" on:tap={onButtonTap} />
            
            <listView items={programs} on:itemTap={onItemTap} row="2" colSpan="2">
               <Template let:item>
                  <label text={item.name} textWrap="true" />
               </Template>
            </listView>
         </gridLayout>
      </tabViewItem>
      <tabViewItem title="Schedule">
         <gridLayout columns="*,120" rows="20,*">
            <label colSpan="2" row="0" textWrap="true">This tab will show you the workout schedule you've defined.</label>
            
            <listView items={programs} on:itemTap={onItemTap} row="2" colSpan="2">
               <Template let:item>
                  <label text={item.name} textWrap="true" />
               </Template>
            </listView>
         </gridLayout>
      </tabViewItem>
      <tabViewItem title="Completed">
         <gridLayout columns="*,120" rows="20,*">
            <label colSpan="2" row="0" textWrap="true">This tab will list completed workouts.</label>
            <listView items="{dones}" on:itemTap="{onDoneTap}" row="2" colSpan="2">
               <Template let:item>
                  <label text="{item.name}" class="todo-item-completed" textWrap="true" />
               </Template>
            </listView>
         </gridLayout>
      </tabViewItem>
   </tabView>
</page>
   
<style>
   .info .fas {
      color: #3a53ff;
   }
   
   .info {
      font-size: 20;
      horizontal-align: center;
      vertical-align: center;
   }

   textField {
      font-size: 20;
   }

   label {
      font-size: 18;
   }

   .todo-item-completed {
      color: #939393;
      text-decoration: line-through;
   }
</style>
   