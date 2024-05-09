
import RT1.rt1 as one, RT2.rt2 as two, RT3.rt3 as three, RT4.rt4 as four
print("Executing to calculate final accuracy of real time samples ...")
final_samples = one.Total_Samples + two.Total_Samples + three.Total_Samples + four.Total_Samples
print("Total Samples = ", final_samples)
correct_pred = one.total_correct_pred + two.total_correct_pred + three.total_correct_pred + four.total_correct_pred
final_accuracy = (correct_pred)/final_samples
print("Final Accuracy = ", format(final_accuracy * 100,".2f"))


