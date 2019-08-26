package team.truffle;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.deeplearning4j.nn.modelimport.keras.KerasModelImport;
import org.deeplearning4j.nn.multilayer.MultiLayerNetwork;

import org.nd4j.linalg.api.ndarray.INDArray;
import org.nd4j.linalg.factory.Nd4j;
import org.nd4j.linalg.io.ClassPathResource;
/** 
 * Uses Jetty to deploy a Keras model. The service can be called as follows:
 * http://localhost:8080/?G1=1&G2=0&G3=1&G4=1&G5=0&G6=1&G7=0&G8=1&G9=1&G10=1
 */
public class DLModel {

	/** the model loaded from Keras **/
	private MultiLayerNetwork model;
	
	/** the number of input parameters in the Keras model **/ 
	private static int inputs = 10;		
	
	
	
	/** Loads the Keras Model **/
	public DLModel() throws Exception {
		String simpleMlp = new ClassPathResource("games.h5").getFile().getPath();
		System.out.println(simpleMlp);
		model = KerasModelImport.importKerasSequentialModelAndWeights(simpleMlp);
	}
		
	/** Returns a prediction for the passed in data set **/
	public double handle() {

		// create a dataset from the input parameters 
		INDArray features = Nd4j.zeros(inputs);
		
		double[] parameter= {1,0,1,1,0,1,0,1,1,1};
		for (int i=0; i<inputs; i++) {
			features.putScalar(new int[] {i}, parameter[i]);
		}
        				
        // output the estimate
		double prediction = model.output(features).getDouble(0);
		
		return prediction;
        
    }        	
}